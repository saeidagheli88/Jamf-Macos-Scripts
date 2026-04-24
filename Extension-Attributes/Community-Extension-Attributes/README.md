# Community Extension Attributes

## Overview

This folder contains a large collection of community-sourced **Jamf Pro Extension Attributes** covering a wide range of macOS management use cases. These are ready-to-use XML and script-based Extension Attributes that can be imported directly into Jamf Pro.

---

## Categories

### Battery
Battery Charge Percentage, Battery Health Status, Battery Cycle Count, Battery Serial Number, Battery Time Remaining, and more.

### Security & Encryption
FileVault 2, PGP Encryption, CheckPoint Encryption, SafeGuard Encryption, EFI Password, Gatekeeper Status, Firewall, Smart Card, and more.

### Network
Active Network Interface, Current Wi-Fi Network, DNS Servers, AirPort Power, Bluetooth State, IP Geo-Location, and more.

### Software Versions
Google Chrome, Firefox, Adobe Reader, Adobe Creative Cloud, Java, Flash, Silverlight, Microsoft Office, QuickTime, and many more.

### Backup & Recovery
Time Machine, CrashPlan, CrashPlan PROe, LiveBackup, PresSTORE, and more.

### OS & System Settings
Login Window, Energy Saver, Power Management, Screensaver, Remote Login, SSH, Spotlight, and more.

### Antivirus & Security Tools
Sophos, Symantec, Norton, McAfee, Forefront, ClamXav, CrowdStrike Falcon, CarbonBlack, Cylance, and more.

### MDM & Management
MDM Profile Verification, Jamf Site, Configuration Profile Check, Remote Management, and more.

### Hardware
GPU, Display, HD Serial Number, iSight Camera, Xserve components, and more.

---

## How to Import into Jamf Pro

1. Go to **Settings → Computer Management → Extension Attributes**
2. Click **New**
3. Click **Upload** and select the `.xml` file
4. Review the settings and click **Save**

For `.sh` and `.py` script-based Extension Attributes:
1. Create a new Extension Attribute manually
2. Set **Input Type** to **Script**
3. Paste the script contents
4. Save

---

## Notes

- These Extension Attributes are community-contributed and may require updates for newer macOS versions
- Always test in a non-production environment before deploying widely
- XML files can be imported directly into Jamf Pro
- Script files (.sh, .py) need to be added manually via the Script input type

---

## Source

Originally sourced from the Jamf community.
Maintained by: Saeid Agheli — Jamf Administrator
https://github.com/saeidagheli88
