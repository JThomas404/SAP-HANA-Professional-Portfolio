# Connecting to AWS Direct Servers

## Table of Contents

1. [Overview](#overview)  
2. [Steps to Complete](#steps-to-complete)  

---

### Overview

You can connect directly to Linux servers hosted on AWS using CLI via PuTTY and using the GUI via XRDP from the customer's Terminal Server. This guide specifically applies to AWS Direct servers and does not apply to SkyOne hosted SLES servers.

---

### Steps to Complete

### Method 1: Connect Using PuTTY

**Step 1: Launch PuTTY Session**  
Open PuTTY from the customer's Terminal Server and select the saved session for the terminal connection to the Linux server.

![putty_launch_session](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/putty_launch_session.png)

**Step 2: Login as EC2 User**  
When prompted for a username, type `ec2-user` and press Enter. You will be logged into the server without having to enter a password.

**Step 3: Switch to Root**  
To switch to root, type `su` and enter the root user password.

**Step 4: Configure SSH Credentials if Connection Fails**  
If you are unable to connect or there is no pre-existing connection in PuTTY:

- Navigate to **Connection > SSH > Auth > Credentials**.
- Click **Browse** under **Private Key File for Authentication** and point to the location of the private key file (usually found in `C:\SN` on the customer's Terminal Server).

![putty_auth_settings](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/putty_auth_settings.png)  
![putty_browse_keyfile](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/putty_browse_keyfile.png)

**Step 5: Save New Session**  
Go back to the **Session** tab in PuTTY, enter the hostname or IP of the HANA server, leave the port as `22`, enter the same name under **Saved Sessions**, then click **Save**.

![putty_save_session](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/putty_save_session.png)

**Step 6: Connect Using Saved Session**  
Double-click on the newly saved session and click **Yes** to save the certificate. You should now be able to establish a secure SSH connection to the SLES server on AWS.

> **IMPORTANT NOTE:**  
> A new standard user named `ec2-user` is created when the server instance is launched and is associated with the private access key of the EC2 instance in AWS. For higher privileges, prefix commands with `sudo` instead of switching to root. Please inform the SAP Infrastructure Support team if you cannot find the private key on the customer's TS server.

---

### Method 2: Connect Using Microsoft Remote Desktop Connection

**Step 1: Open RDP Session**  
Open Microsoft Remote Desktop Connection and use the HANA server's hostname or IP address for a GUI session.

**Step 2: Login as Root**  
Since the EC2 instance's access key is not associated with XRDP, you will need to sign in using the root user.

**Step 3: Use Take Control to Paste Password**  
If you cannot paste the password using the keyboard shortcut when connecting via XRDP, use **Take Control** to paste the password.

![xrdp_gui_connection](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/xrdp_gui_connection.png)

---