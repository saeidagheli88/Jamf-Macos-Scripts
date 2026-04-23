# Rename Device - Room-Serial

## Overview

This script automatically renames a macOS computer in the format **`Room-SerialNumber`** (e.g., `LAB101-C02XG2JQJG5H`). It pulls the **Room** value from the computer's Jamf Pro inventory record and the **Serial Number** directly from the device hardware.

This uses the modern **Jamf Pro API Client and Role** authentication (OAuth2). The required API permissions are documented inside the script.

---

## Key Features

- Uses **API Client + API Role** (modern OAuth2 — no username/password)
- Required permissions are **documented inside the script**
- Credentials passed securely via **Jamf Pro policy parameters $4 and $5**
- Validates Room field is populated before renaming
- Submits a **Jamf recon** after renaming to keep inventory in sync

---

## How It Works

1. Reads the Jamf Pro server URL from the device local preferences
2. Authenticates with the Jamf Pro API using Client ID ($4) and Client Secret ($5)
3. Retrieves the device hardware serial number via ioreg
4. Looks up the Room field from the Jamf Pro computer Location record
5. Validates that the Room field is not empty
6. Combines Room and Serial into the format: ROOM-SERIAL
7. Applies the new name using jamf setComputerName
8. Submits a jamf recon to update the Jamf Pro inventory record

---

## Jamf Pro Setup

### Step 1 — Create an API Role
1. Go to Settings → System → API Roles and Clients
2. Click API Roles → New
3. Name it Rename-Device
4. Add permission: Read Computers
5. Save

### Step 2 — Create an API Client
1. Click API Clients → New
2. Name it Rename-Device-Client
3. Assign the role above
4. Set Access Token Lifetime (e.g., 30 minutes)
5. Click Enable → Save
6. Copy the Client ID and Client Secret

### Step 3 — Add Script to Jamf Pro
1. Go to Settings → Computer Management → Scripts → New
2. Paste the contents of rename-room-serial.sh
3. Under Options tab, label parameters:
   - Parameter 4: API Client ID
   - Parameter 5: API Client Secret
4. Save

### Step 4 — Create a Policy
1. Go to Computers → Policies → New
2. Add the script and fill in:
   - $4 = Your API Client ID
   - $5 = Your API Client Secret
3. Set Scope and Trigger

### Step 5 — Populate the Room Field
1. Go to Computers, find the computer, click Edit
2. Click Location tab
3. Fill in the Room field (e.g., LAB101)
4. Save

If the Room field is empty the script will exit with an error and will not rename the device.

---

## Script Parameters

- Parameter 4 (client_id): Jamf Pro API Client ID
- Parameter 5 (client_secret): Jamf Pro API Client Secret

---

## Example Output

Jamf Pro URL: https://yourcompany.jamfcloud.com
Bearer token obtained successfully.
Serial: C02XG2JQJG5H
Room: LAB101
New computer name assigned: LAB101-C02XG2JQJG5H

---

## Error Handling

- ERROR: Failed to obtain bearer token — Wrong credentials or expired client. Check Client ID/Secret in policy.
- ERROR: Room field is empty — Room not filled in Jamf Pro. Edit computer Location record.

---

## Author

Saeid Agheli — Jamf Administrator
https://github.com/saeidagheli88
