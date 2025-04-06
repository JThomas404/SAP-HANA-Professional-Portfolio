# HANA server using WinSCP (Transferring Files to Linux with WinSCP)

## Table of Contents

1. [Overview](#overview)  
2. [Steps to Complete](#steps-to-complete)

---

### Overview

- This guide explains how to transfer files between Windows and Linux servers using WinSCP.  
- WinSCP should already be installed on the Terminal Servers for all SAP B1 HANA Customers.

---

### Steps to Complete

#### Step 1: Open WinSCP and Connect to the SLES Server

- Connect to the customer's TS server and open WinSCP.  
- There should already be a connection created for the SLES server; double-click on the connection to open it and enter the SLES server's username and password.

![winscp-connection-screen.png](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/winscp-connection-screen.png)

---

**IMPORTANT NOTE:**

- **AWS Direct**:  
  Use the `ec2-user` to connect to the SLES server. There is no password (an access key is used in the backend). You cannot log in directly as root and can only transfer files to `/home/ec2-user`. Use PuTTY to switch to root and move files as needed.

- **Ekkum**:  
  Use the `snsys` username/password. Root login is disabled. You can only transfer files to `/home/snsys`. Use PuTTY to switch to root and move files as needed.

- **Huawei & On-Premises**:  
  Use the `root` username/password to connect directly. Permissions are not limited.

---

#### Step 2: Transfer Files Between Windows and Linux

- The Windows server’s filesystem appears on the **left**, and the Linux server’s on the **right**.
- Navigate to the source file/folder on Windows and destination on Linux, then **drag and drop** the file to transfer.

![winscp-file-transfer.png](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/winscp-file-transfer.png)

---