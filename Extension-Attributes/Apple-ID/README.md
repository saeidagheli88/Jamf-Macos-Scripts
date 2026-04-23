# Extension Attribute - Apple ID

## Overview

This Jamf Pro Extension Attribute checks which Apple ID (Apple Account) is currently signed in on the Mac and reports it back to Jamf Pro inventory. The result is displayed under the **Extension Attributes** section of the computer record.

This is useful for verifying Apple ID sign-in status across your fleet, ensuring users are signed in with the correct managed Apple ID, and auditing personal vs corporate Apple ID usage.

---

## Configuration Details

| Field | Value |
|---|---|
| **Display Name** | Apple ID |
| **Description** | Methods to check Apple Account login in Jamf |
| **Data Type** | String |
| **Inventory Display** | Extension Attributes |
| **Input Type** | Script |
| **Language** | Shell/Bash |
| **Enabled** | Yes |

---

## How It Works

1. Detects the currently logged-in user via `/dev/console`
2. Checks if a valid user session is active (skips root and loginwindow)
3. Reads the `MobileMeAccounts.plist` file from the user's preferences
4. Extracts the `AccountID` value which contains the Apple ID email
5. Returns the Apple ID to Jamf Pro, or a descriptive status if not signed in

---

## Possible Results

| Result | Meaning |
|---|---|
| `user@example.com` | Apple ID signed in successfully |
| `Not Signed In` | No Apple ID found on this device |
| `No User Logged In` | No active user session at time of inventory |

---

## Jamf Pro Setup

### Step 1 — Create the Extension Attribute
1. Go to **Settings → Computer Management → Extension Attributes**
2. Click **New**
3. Fill in the following:
   - **Display Name:** `Apple ID`
   - **Description:** `Methods to check Apple Account login in Jamf`
   - **Data Type:** `String`
   - **Inventory Display:** `Extension Attributes`
   - **Input Type:** `Script`
   - **Language:** `Shell/Bash`
4. Paste the contents of `apple-id.sh` into the script field
5. Click **Save**

### Step 2 — Trigger Inventory Update
1. Go to **Computers → Policies**
2. Create or use an existing policy with **Inventory Collection** payload
3. Scope to target computers and run

---

## Use Cases

- **Audit** which Apple ID is signed in on each device
- **Smart Groups** — group devices by Apple ID domain (e.g., corporate vs personal)
- **Compliance** — verify users are signed in with managed Apple IDs
- **Troubleshooting** — identify devices where no Apple ID is signed in

---

## Smart Group Example

You can create a Smart Group to find all devices NOT signed in with a corporate Apple ID:

| Criteria | Operator | Value |
|---|---|---|
| Apple ID | does not contain | @yourcompany.com |

---

## Notes

- The script reads from `MobileMeAccounts.plist` which is maintained by macOS
- This attribute is collected during every Jamf inventory recon
- No admin privileges or API credentials are required for this Extension Attribute
- Works on macOS 10.14 and later

---

## Author

Saeid Agheli — Jamf Administrator
https://github.com/saeidagheli88
