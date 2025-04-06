# Troubleshooting Low Disk Space

## Table of Contents

1. [Overview](#overview)  
2. [Example Scenario](#example-scenario)  
3. [Troubleshooting Steps](#troubleshooting-steps)  
4. [Useful Commands](#useful-commands)  
5. [Additional Notes](#additional-notes)  

---

## Overview

SAP/HANA on Linux has data spread out over several partitions. Refer to the below disk space checks from N-sight RMM:

![Disk Space Overview](../../images/disk_space_check.png)

- **/** mountpoint: The root partition for the Linux OS (similar to the C: drive on Windows).  
- **/hana/data** mountpoint: Contains in-memory data. When save points or snapshots are created, or a delta merge operation is performed, data is written from memory to this volume.  
- **/hana/log** mountpoint: Contains redo log segments used to restore the database after a server reboot.  
- **/hana/shared** mountpoint: The install directory for HANA, containing program binaries, config, log files, etc.  
- **/hana/backup** mountpoint: Associated with RSP backups.  
- **/usr/sap** mountpoint: The install directory for SAP, containing program binaries, config, log files, etc.  

You will generally receive disk space alerts against the **/hana/shared** volume and **/usr/sap**. Use this guide to troubleshoot disk space and escalate to the SAP Infrastructure Support team as necessary.

---

## Example Scenario

Typical example ticket:
> **Service Ticket #750267 - Disk Space Check - drive /hana/shared: Huawei Cloud - Jumra > Jumra > jumra-prod-hana**

![Low Space Alert](images/example_alert.png)

- Logged into the SLES portal.  
- Disk space was critically low (only 283.12 MB free).

![SLES Portal](images/low_disk_space.png)

- Logged into HANA SystemDB.  
- No additional backups were present in the Backup Catalog.

![Backup Catalog](images/backup_catalog.png)

- Used PuTTY to connect to the HANA server.  
- Confirmed that `/hana/shared` was 100% utilised.

![Shared Utilised](images/shared_utilised.png)

![Usage Confirmation](images/usage_check.png)

- Launched HANA Studio.  
- Verified that System DB backups were writing to `/usr/sap`, and tenant backups to `/hana/backup`, but both were outdated.  
- Ran new backups for both.  
- Tenant backup (89GB+) took a long time.

![Tenant Backup](images/tenant_backup.png)

- Deleted old backup and log files after the backup completed.  
- Freed up significant space.

![Space Freed](images/space_freed.png)

- After completing SystemDB backup and cleanup, freed up ~30GB.

![SystemDB Space](images/systemdb_cleanup.png)

- Verified updated mount space.

![Final Space](images/final_mount_status.png)

---

## Troubleshooting Steps

**Step 1:** Ensure RSP backups are functional and that old backups are automatically purged. Refer to the **RSP Backup Failures [link to Troubleshooting RSP Backup Failures.md](./Windows%20Server/Troubleshooting%20RSP%20Backup%20Failures.md)** Repo for more info.

**Step 2:** If backups are fine and System DB is backed up, check disk usage with:

```bash
du -hca /hana/shared | sort -h
```

If root (`/`) is full, use:

```bash
cd /
du -sh *
```

**Step 3:** Identify the largest space consumers (folders/files).

![Directory Size Check](images/space_hog.png)

**Step 4:** Navigate to that directory and use the commands below to inspect files. Look for old, large log files that may be safely removed (after approval).

---

## Useful Commands

- **Check overall disk usage:**
    ```bash
    df -h
    ```

- **List directory sizes under a volume:**
    ```bash
    du -hca /hana/shared | sort -h
    ```

- **Check size of specific file/folder:**
    ```bash
    du -sh file_or_folder
    ```

- **Check when a file was last accessed:**
    ```bash
    stat file_name
    ```

- **Delete file (with caution):**
    ```bash
    rm /path/to/file
    ```

- **Delete folder recursively (dangerous):**
    ```bash
    rm -r /path/to/folder
    ```

---

## ⚠️ Important Note

Use extreme caution when deleting files/folders on Linux, especially as root.  
There is **no confirmation prompt**—deleted data is gone immediately.

---

## Additional Notes

- **Never delete** any files from a HANA server unless explicitly approved.  
- Always escalate to the **SAP Infrastructure Support** team for confirmation.
- Log a ticket with **SkyOne** for disk issues on **/usr/sap** and **/** volumes.
- Disk issues on **/hana/data** or **/hana/log** should be escalated immediately as they are critical.

---