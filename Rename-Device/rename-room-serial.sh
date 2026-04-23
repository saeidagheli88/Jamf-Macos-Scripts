#!/bin/bash
####################################################################################################
# Rename - Room-Serial
#
# Renames the computer to "Room-Serial" by pulling the room from the Jamf Pro
# record and the serial number from the device.
#
# Jamf Pro API Client Permissions Required:
#   - Read Computers
#
# Script Parameters:
#   $4 - API Client ID
#   $5 - API Client Secret
####################################################################################################
client_id="$4"
client_secret="$5"
jamf_url=$(defaults read /Library/Preferences/com.jamfsoftware.jamf.plist jss_url | sed 's|/$||')
echo "Jamf Pro URL: $jamf_url"
response=$(curl -s -X POST "$jamf_url/api/oauth/token" \
	-H "Content-Type: application/x-www-form-urlencoded" \
	-d "grant_type=client_credentials&client_id=$client_id&client_secret=$client_secret")
bearerToken=$(echo "$response" | plutil -extract access_token raw -)
if [[ -z "$bearerToken" || "$bearerToken" == "null" ]]; then
	echo "ERROR: Failed to obtain bearer token."
	exit 1
fi
echo "Bearer token obtained successfully."
SERIAL=$(ioreg -l | awk '/IOPlatformSerialNumber/ { print $4;}' | sed 's/"//g')
echo "Serial: $SERIAL"
ROOM=$(curl -s -H "Authorization: Bearer $bearerToken" \
	"$jamf_url/JSSResource/computers/serialnumber/$SERIAL/subset/location" \
	| xmllint --format - 2>/dev/null \
	| awk -F'>|<' '/<room>/{print $3}')
echo "Room: $ROOM"
if [[ -z "$ROOM" ]]; then
	echo "ERROR: Room field is empty in Jamf Pro record, exiting."
	exit 1
fi
NEWCOMPUTERNAME="${ROOM}-${SERIAL}"
/usr/local/bin/jamf setComputerName -name "$NEWCOMPUTERNAME"
jamf recon -setComputerName "$NEWCOMPUTERNAME"
echo "New computer name assigned: $NEWCOMPUTERNAME"
exit 0
