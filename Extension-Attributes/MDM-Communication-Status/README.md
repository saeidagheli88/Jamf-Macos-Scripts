# Extension Attribute - MDM Communication Status

## Overview

This Jamf Pro Extension Attribute checks whether a Mac is successfully communicating with the MDM server. It scans the macOS system log for MDM identity errors over the last 24 hours and reports the result back to Jamf Pro inventory under the **Extension Attributes** section.

This is essential for identifying devices that have broken MDM communication and may not be receiving policies, profiles, or commands from Jamf Pro.

---

## Configuration Details

| Field | Value |
|---|---|
| **Display Name** | MDM Communication Status |
| **Data Type** | String |
| **Inventory Display** | Extension Attributes |
| **Input Type** | Script |
| **Language** | Shell/Bash |
| **Enabled** | Yes |

---

## How It Works

1. Runs `log show` to query the macOS unified log for the last 24 hours
2. Filters log entries from the `mdmclient` process
3. Searches for the error string `Unable to create MDM identity`
4. If no errors are found — reports **MDM is communicating**
5. If errors are found — reports **MDM is broken**

---

## Possible Results

| Result | Meaning |
|---|---|
| `MDM is communicating` | No MDM identity errors found — device is healthy |
| `MDM is broken` | MDM identity errors detected — device needs attention |

---

## Jamf Pro Setup

### Step 1 — Create the Extension Attribute
1. Go to **Settings → Computer Management → Extension Attributes**
2. Click **New**
3. Fill in the following:
   - **Display Name:** `MDM Communication Status`
   - **Data Type:** `String`
   - **Inventory Display:** `Extension Attributes`
   - **Input Type:** `Script`
   - **Language:** `Shell/Bash`
4. Paste the contents of `mdm-communication-status.sh` into the script field
5. Click **Save**

### Step 2 — Trigger Inventory Update
1. Go to **Computers → Policies**
2. Create or use an existing policy with **Inventory Collection** payload
3. Scope to target computers and run

---

## Use Cases

- **Health Monitoring** — identify devices with broken MDM communication
- **Smart Groups** — group all devices where MDM is broken for targeted remediation
- **Reporting** — audit MDM health across your entire fleet
- **Alerting** — use Smart Groups to trigger automated remediation policies

---

## Smart Group Example

Create a Smart Group to find all devices with broken MDM:

| Criteria | Operator | Value |
|---|---|---|
| MDM Communication Status | is | MDM is broken |

You can then scope a remediation policy to this Smart Group.

---

## Remediation Tips

If a device reports **MDM is broken**, try the following:

1. **Re-enroll the device** via Jamf Pro remote command
2. **Check the MDM profile** — go to System Settings → Privacy & Security → Profiles
3. **Run** `sudo profiles renew -type enrollment` in Terminal
4. **Check network connectivity** to your Jamf Pro server
5. **Review logs** with: `log show --predicate '(process CONTAINS "mdmclient")' --last 1h`

---

## Notes

- The script checks logs from the **last 24 hours** only
- Results are updated every time a Jamf inventory recon runs
- No API credentials or admin parameters are required
- Works on macO
cd ~/Desktop/Jamf-macOS-Scripts
git add .

cat > ~/Desktop/Jamf-macOS-Scripts/Extension-Attributes/MDM-Communication-Status/README.md << 'EOF'
# Extension Attribute - MDM Communication Status

## Overview

This Jamf Pro Extension Attribute checks whether a Mac is successfully communicating with the MDM server. It scans the macOS system log for MDM identity errors over the last 24 hours and reports the result back to Jamf Pro inventory under the **Extension Attributes** section.

This is essential for identifying devices that have broken MDM communication and may not be receiving policies, profiles, or commands from Jamf Pro.

---

## Configuration Details

| Field | Value |
|---|---|
| **Display Name** | MDM Communication Status |
| **Data Type** | String |
| **Inventory Display** | Extension Attributes |
| **Input Type** | Script |
| **Language** | Shell/Bash |
| **Enabled** | Yes |

---

## How It Works

1. Runs `log show` to query the macOS unified log for the last 24 hours
2. Filters log entries from the `mdmclient` process
3. Searches for the error string `Unable to create MDM identity`
4. If no errors are found — reports **MDM is communicating**
5. If errors are found — reports **MDM is broken**

---

## Possible Results

| Result | Meaning |
|---|---|
| `MDM is communicating` | No MDM identity errors found — device is healthy |
| `MDM is broken` | MDM identity errors detected — device needs attention |

---

## Jamf Pro Setup

### Step 1 — Create the Extension Attribute
1. Go to **Settings → Computer Management → Extension Attributes**
2. Click **New**
3. Fill in the following:
   - **Display Name:** `MDM Communication Status`
   - **Data Type:** `String`
   - **Inventory Display:** `Extension Attributes`
   - **Input Type:** `Script`
   - **Language:** `Shell/Bash`
4. Paste the contents of `mdm-communication-status.sh` into the script field
5. Click **Save**

### Step 2 — Trigger Inventory Update
1. Go to **Computers → Policies**
2. Create or use an existing policy with **Inventory Collection** payload
3. Scope to target computers and run

---

## Use Cases

- **Health Monitoring** — identify devices with broken MDM communication
- **Smart Groups** — group all devices where MDM is broken for targeted remediation
- **Reporting** — audit MDM health across your entire fleet
- **Alerting** — use Smart Groups to trigger automated remediation policies

---

## Smart Group Example

Create a Smart Group to find all devices with broken MDM:

| Criteria | Operator | Value |
|---|---|---|
| MDM Communication Status | is | MDM is broken |

You can then scope a remediation policy to this Smart Group.

---

## Remediation Tips

If a device reports **MDM is broken**, try the following:

1. **Re-enroll the device** via Jamf Pro remote command
2. **Check the MDM profile** — go to System Settings → Privacy & Security → Profiles
3. **Run** `sudo profiles renew -type enrollment` in Terminal
4. **Check network connectivity** to your Jamf Pro server
5. **Review logs** with: `log show --predicate '(process CONTAINS "mdmclient")' --last 1h`

---

## Notes

- The script checks logs from the **last 24 hours** only
- Results are updated every time a Jamf inventory recon runs
- No API credentials or admin parameters are required
- Works on macOS 10.12 and later (unified logging system)

---

## Author

Saeid Agheli — Jamf Administrator
https://github.com/saeidagheli88
