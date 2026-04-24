# Community Scripts

## Overview

This folder contains a large collection of community-sourced **Jamf Pro Scripts** covering a wide range of macOS management tasks. These are ready-to-use Bash, Python, and AppleScript files that can be uploaded directly into Jamf Pro and deployed via policies.

---

## Categories

### Active Directory & LDAP
ADJoin-Centrify, bindToLDAP, unbindAD, unbindOD, changeADAdminGroups, changeLDAPConnectionTimeout, addToODComputerGroup, and more.

### Security & Encryption
enableFileVault, EncryptExternalVolume, encryptVirtualMemory, enableFirewall, disableGuestLogin, disableAutoLogout, disableCoreDumps, importCACert, secureBonjour, limitSSHScope, and more.

### Software Installation & Updates
AdobeReaderUpdate, AdobeAIRUpdate, FirefoxInstall, GoogleChromeInstall, InstallGoogleFileStream, Install_VMWare, Office2016_Updater, Office2019_O365_Updater, VLC_Install_&_Update, zeplin_install, and more.

### Network & Wi-Fi
setWiFiNetwork, setAirPortNetwork, setDNSServers, setSearchDomains, setWebProxy, AddSearchDomains, WaitForWifiConnection, turnOffAirport, disableAirPort, and more.

### Antivirus & Security Tools
runSophosScan, updateSophosVirusDefs, Sophos_Anti-Virus_Override, runClamXavScan, updateClamXav, runVirusBarrierScan, runSAVScan, runSAVLiveUpdate, Toggle_UmbrellaRC, and more.

### System Configuration
setTimeZone, setTimeServers, configurePowerSave, disablePowerSave, enablePowerSave, disableBluetooth, disableFirewire, disableIR, disableUSB, disableiSight, and more.

### Disk & Storage
partitionDisk, RenameStartupVolume, bootFrozen, bootThawed, freezeTargetPartition, thawTargetPartition, mountNetworkShare, and more.

### User & Login Management
MobileAccountAliasFix, disableGuestFolderSharing, disableAutoLogout, disableBluetoothSetupAssistant, disableKeyboardSetupAssistant, disableMobileMePrefPane, and more.

### Jamf & MDM
updateDeviceInventory, jss_api_id_staticgroup, list_computers_no_check-in_time, update_nbi_casper_imaging, uploadMobileDeviceApp, setup_munki, and more.

### macOS Upgrades
Start_macOS_1014_Upgrade, pkgver, install_from_vendorDMG, installPKGfromDMG, and more.

---

## How to Add Scripts to Jamf Pro

1. Go to **Settings → Computer Management → Scripts**
2. Click **New**
3. Give the script a name
4. Paste the contents of the `.sh`, `.py`, or `.scpt` file
5. Under the **Options** tab, add any parameter labels if needed
6. Click **Save**

Then create a **Policy** to deploy the script:
1. Go to **Computers → Policies → New**
2. Under **Scripts**, add your script
3. Set the **Scope** and **Trigger**
4. Click **Save**

---

## File Types

| Extension | Type | Notes |
|---|---|---|
| `.sh` | Bash Shell Script | Most common — runs natively on macOS |
| `.py` | Python Script | Requires Python installed on the device |
| `.scpt` | AppleScript | For GUI automation tasks |

---

## Notes

- These scripts are community-contributed and may require updates for newer macOS versions
- Always test scripts in a non-production environment before deploying widely
- Some scripts may require parameters — check the script header for details
- Scripts that reference third-party tools (Sophos, CrashPlan, etc.) require those tools to be installed

---

## Source

Originally sourced from the Jamf community.
Maintained by: Saeid Agheli — Jamf Administrator
https://github.com/saeidagheli88
