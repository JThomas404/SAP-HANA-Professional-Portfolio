# Installing Remote Support Platform

## Table of Contents

1. [Overview](#overview)
2. [Steps to Complete](#steps-to-complete)

---

### Overview

This guide explains how to install and configure the SAP Remote Support Platform (RSP) for backing up the HANA Tenant Database. If you encounter any issues during the installation, please escalate to the SAP Infrastructure Support Team.

---

### Steps to Complete

#### **Step 1:** **Download the Installation Package**

- Obtain the installation package from the designated source.

---

#### **Step 2:** **Installation Options**

- Leave the default recommended option selected and click **Next**.

![installation_options](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/installation_options.png)

---

#### **Step 3:** **Enter Database Server Information**

- Change the **Database Type** to **HANA**.
- Enter the following details:
    - **HANA Server Host Name**
    - **Instance Number**
    - **Tenant DB Name**
    - **HANA SYSTEM Username and Password**
- Click **Next**.

![database_server_info](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/database_server_info.png)

---

#### **Step 4:** **Create an RSP Administrator Account**

- Use `rspadmin` as the username and create a secure password.
- Enter your email address (mandatory) and click **Next** until the installation starts.

![create_rsp_account](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/create_rsp_account.png)

---

#### **Step 5:** **Launch RSP**

- Open RSP from the SAP B1 folder in the Start menu.
- Enter the `rspadmin` username and password created earlier.
- If prompted for SAP Channel Technical user, select **Do not show message again** and close the message.

![launch_rsp](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/launch_rsp.png)

---

#### **Step 6:** **Partner Channel Details**

- If you see a message after launching RSP, request the responsible SAP Support Team to enter their partner channel details to prevent the message from appearing each time RSP opens. Alternatively, the wizard can be cancelled.

![partner_channel_details](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/partner_channel_details.png)

---

#### **Step 7:** **Configure SLD Connection**

- Navigate to **Configuration > Backups**.
- Go to the **SLD** tab under the **Databases** section and enter the server URL:
  
  ```
  https://servername:40000/sld/sld.svc
  ```

- Enter the **B1SiteUser** password and test the connection.

![configure_sld_connection](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/configure_sld_connection.png)

---

#### **Step 8:** **Enable RSP Backups**

- Go to the **Backups** section and enable RSP backups for SAP HANA.
- Press **Yes** to continue and save the configuration.

![enable_rsp_backups](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/enable_rsp_backups.png)

---

#### **Step 9:** **Backup Strategy Configuration**

- Navigate to **Configuration > Backup Management > Backup Strategy > Instance Backup**.
- Ensure that the **Instance Backup** option is ticked. The time can be left at the default setting of **12 AM**.
- Ensure that **Delete Older Backups After Successful Instance Backup** is ticked.

![backup_strategy_configuration](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/backup_strategy_configuration.png)

---

#### **Step 10:** **Trigger Manual Backup**

- Initiate a manual instance backup and verify that it completes without any errors.

---