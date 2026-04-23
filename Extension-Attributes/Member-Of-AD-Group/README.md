# Extension Attribute - Member Of AD Group

## Overview

This Jamf Pro Extension Attribute pulls the Active Directory (AD) group membership for the logged-in user and displays it in the **User and Location** section of the computer inventory record in Jamf Pro.

It uses **Directory Service Attribute Mapping** to query the `memberOf` attribute directly from Active Directory — no script required.

---

## Configuration Details

| Field | Value |
|---|---|
| **Display Name** | Member Of AD Group |
| **Data Type** | String |
| **Inventory Display** | User and Location |
| **Input Type** | Directory Service Attribute Mapping |
| **Directory Service Attribute** | memberOf |
| **Allow Multiple Values** | Yes |

---

## How It Works

1. Jamf Pro queries the Directory Service (Active Directory) during inventory collection
2. It reads the `memberOf` attribute for the computer or logged-in user
3. The result is stored in the Jamf Pro computer record under **User and Location**
4. The value can be used in **Smart Groups**, **Policies**, and **Reports**

---

## Jamf Pro Setup

### Step 1 — Create the Extension Attribute
1. Go to **Settings → Computer Management → Extension Attributes**
2. Click **New**
3. Fill in the following:
   - **Display Name:** `Member Of AD Group`
   - **Description:** `This Extension pulls all the user group memberships from Active Directory and displays them in Jamf Pro under the User and Location section`
   - **Data Type:** `String`
   - **Inventory Display:** `User and Location`
   - **Input Type:** `Directory Service Attribute Mapping`
   - **Directory Service Attribute:** `memberOf`
   - **Allow Attribute Multiple Values:** ✅ Enabled
4. Click **Save**

### Step 2 — Bind Macs to Active Directory
Make sure your Macs are bound to Active Directory:
1. Go to **Settings → Computer Management → Directory Bindings**
2. Add your Active Directory domain if not already present
3. Ensure computers are bound before running inventory

### Step 3 — Trigger Inventory Update
1. Go to **Computers → Policies** → create or use an existing policy
2. Add **Inventory Collection** payload
3. Scope to target computers and run

---

## Use Cases

- **Smart Groups** — Group computers by AD group membership (e.g., all machines where user is in `IT-Admins`)
- **Scoping Policies** — Deploy software only to users in specific AD groups
- **Reporting** — Audit which AD groups are assigned to which devices
- **Compliance** — Verify privileged group memberships across your fleet

---

## Example Value in Jamf Pro
---

## Notes

- This Extension Attribute requires the Mac to be **bound to Active Directory**
- The `memberOf` attribute returns all groups the user belongs to, including nested groups
- Enabling **Allow Multiple Values** is recommended so all group memberships are captured
- Values are updated every time a Jamf inventory recon runs

---

## Author

Saeid Agheli — Jamf Administrator
https://github.com/saeidagheli88
