# Resolving RSP GUID Error

## Table of Contents

1. [Overview](#overview)
2. [Troubleshooting Steps](#troubleshooting-steps)

## Overview

This guide demonstrates how to resolve a common error that causes RSP backups to fail: "An error occurred while processing this request. Could not determine the status for the given GUID."

## Troubleshooting Steps

### Step 1: Confirm the Error

1. Log into RSP.
2. Check that backups are failing due to the GUID error by clicking on the **DB Backup: Failed** link next to the failed instance backup under **Backup History**.
    
    ![failed_backup](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/failed_backup.png)
    
3. The log file will open in a web browser window, displaying the error message.

    ![guid_error_log](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/guid_error_log.png)

### Step 2: Access the Log Files

1. Log into the HANA server.
2. Navigate to the log directory:
    
    ```bash
    cd /var/log/SAPBusinessOne/BackupService/logs/<hostname_port>
    ```
    
    (Replace `<hostname_port>` with the specific hostname and port for your server, e.g., `192.168.86.2_30015`.)
    
    ![log_directory](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/log_directory.png)

### Step 3: Rename Log Files

Rename both the `_instanceBackup.log` and `_instanceBackup.pid` files using the following command:

```bash
mv _instanceBackup.log _instanceBackup.log.old && mv _instanceBackup.pid _instanceBackup.pid.old
```

### Step 4: Trigger a Manual Backup

1. Trigger a manual instance backup in RSP and verify that the backup completes without error. See the [Trigger Manual RSP Backups](./Guides/Windows%20Servers/Trigger%20Manual%20RSP%20Backups.md) KBA for guidance.

---







