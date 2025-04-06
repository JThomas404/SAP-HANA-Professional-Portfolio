# Troubleshooting RSP Backup Failures

## Table of Contents

1. [Overview](#overview)  
2. [Troubleshooting Steps](#troubleshooting-steps)  
3. [Additional Notes](#additional-notes)  

---

## Overview

Remote Support Platform (RSP) is used for scheduled instance backups of the Tenant Database in HANA. It automates backups and manages disk space by removing old log backups. However, RSP does not back up the System Database, necessitating manual backups from HANA Studio.

**Important:** If RSP backup failures are left unattended, the `/hana/shared` disk may run out of space, as log backups are not deleted automatically after a successful instance backup.

---

## Troubleshooting Steps

### Step 1: Check RSP Backup History

Navigate to **Configuration > Backup Management > Backup History** to determine if backups are failing or running.

![RSP Backup History](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/RSP_Backup_History.png)

### Step 2: Investigate Backup Failure

Click on the **DB Backup: Failed** message to view failure reasons in a web browser.

![Investigating Backup Failure](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/Investigating_Backup_Failure.png)

### Step 3: Check Disk Space

Connect to the SLES server and run the command:

```bash
df -h
```

Focus on the `/hana/shared` volume for available space.

![Disk Space Check](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/Disk_Space_Check_2.png)

### Step 4: Verify Database Connections

Log into HANA Studio using SYSTEM user credentials. Ensure both System and Tenant DBs are visible. If only one database appears, switch workspaces using **File > Switch Workspace**. If neither database is visible, refer to the guide for adding databases.

### Step 5: Backup System Database

Right-click on **SYSTEMDB@HDB**, select **Backup and Recovery > Back Up System Database**, then click **Next** and **Finish**.

### Step 6: Manage Backup Catalog

Double-click on **Backup** under **SYSTEMDB@HDB** and select the **Backup Catalog** tab. Right-click the most recent backup and select **Delete Older Backups**.

![Backup Catalog](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/_Backup_Catalog_2.png)

### Step 7: Confirm Deletion

In the prompt, select **Catalog and Backup Location**, ensuring that **File System** is checked. Click **Next** and **Finish** to delete the oldest backup.

### Step 8: Check Disk Space Again

Run the `df -h` command again on the `/hana/shared` volume to see if space has been freed up.

### Step 9: Trigger Instance Backup

Go back to RSP, open the **Backup Strategy Settings**, and select **Trigger Instance Backup Now**.

### Step 10: Follow Up on Disk Space Issues

If space is still a problem, refer to the Troubleshooting Low Disk Space repository.

---

## Additional Notes

- Refer to the recommended backup strategy settings in RSP.

![Backup Strategy Settings](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/Backup_Strategy_Settings.png)

- Ensure the **Instance Backup** option is checked and a backup time is scheduled.
- If backups are not running, enable **Delete Older Backups After Successful Instance Backup** to prevent space issues.
- If you encounter the error "Backup Service is Unavailable," check that the SAP RSP Agent Backup Service is running.
- RSP relies on the System Landscape Directory (SLD). If the SLD is unreachable, RSP will stop functioning.
- For other potential issues, refer to the **Resolving RSP GUID Error** documentation for common troubleshooting steps.

---