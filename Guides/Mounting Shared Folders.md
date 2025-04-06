# Mounting Shared Folders

## Table of Contents

1. [Overview](#overview)
2. [Steps to Complete](#steps-to-complete)

---

## Overview

Mounting shared folders, especially for SAP email attachments, is a common request typically logged by SAP consultants. This guide provides the steps to create and configure a shared folder for access.

---

## Steps to Complete

**Step 1:** Navigate to the `/mnt` folder and create a new folder named `sbomailer` if it does not already exist.

```bash
cd /mnt
mkdir sbomailer
```

**Step 2:** Change the folder's permissions recursively to allow read, write, and execute for all users:

```bash
chmod -R 777 /mnt/sbomailer
```

**Step 3:** Edit the `/etc/fstab` file using the Vi Text Editor:

```bash
vi /etc/fstab
```

- **If the Attachments folder is located locally on the HANA server, add the following line:**
    
    ```
    //mitas-prod-hana/B1_SHF/Attachments /mnt/sbomailer cifs rw,user=b1service0,pass=b1service0,nofail 0 0
    ```

- **If the Attachments folder is located on a remote server (e.g., the TS server), enter:**
    
    ```
    //mitas-prod-hana/B1_SHF/Attachments /mnt/sbomailer cifs rw,user=b1service0,pass=b1service0,nofail 0 0
    ```

**IMPORTANT NOTE:**

Please be extremely careful when editing or adding information to the `/etc/fstab` file, as it contains the configuration necessary to mount the root and HANA volumes. Inadvertent changes could prevent the server from booting or cause the HANA disks to go offline.

**Step 4:** Force the kernel to re-read the `/etc/fstab` file so that the newly added mount point can be mounted on the system.

```bash
mount -a
```

Any errors will be displayed after executing the command. No output means the mount operation completed successfully.

**Step 5:** Verify that the folder was mounted successfully.

```bash
df -h
```

The new mount will appear at the bottom of the list.

![mounted_folder](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/mounted_folder.png)

Alternatively, you can issue the `mount` command with no options to verify that the mount exists.

![mount_verification](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/mount_verification.png)

**Step 6:** Ensure that the mount point is accessible and writable by navigating to the `sbomailer` folder created in Step 1.

```bash
cd /mnt/sbomailer && ls -l
```

---