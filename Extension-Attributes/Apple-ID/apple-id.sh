#!/bin/bash
####################################################################################################
# Extension Attribute - Apple ID
#
# Checks and returns the Apple ID (Apple Account) signed in on the device.
# Displays the result in Jamf Pro under Extension Attributes.
#
# Returns:
#   - The Apple ID email address if signed in
#   - "Not Signed In" if no Apple ID is found
#   - "No User Logged In" if no user session is active
####################################################################################################
loggedInUser=$(/usr/bin/stat -f%Su /dev/console)

if [ -z "$loggedInUser" ] || [ "$loggedInUser" = "root" ] || [ "$loggedInUser" = "loginwindow" ]; then
    echo "<result>No User Logged In</result>"
    exit 0
fi

plist="/Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist"

if [ ! -f "$plist" ]; then
    echo "<result>Not Signed In</result>"
    exit 0
fi

appleID=$(/usr/bin/defaults read "$plist" 2>/dev/null | /usr/bin/awk -F'"' '/AccountID/ {print $2; exit}')

if [ -z "$appleID" ]; then
    echo "<result>Not Signed In</result>"
else
    echo "<result>$appleID</result>"
fi
