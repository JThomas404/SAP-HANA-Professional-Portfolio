# HANA Server Reboot Process

## Table of Contents

1. [Overview](#overview)
2. [Process on Huawei, AWS Direct, Azure, Ekkum, & On-Premises HANA Servers](#process-on-huawei-aws-direct-azure-ekkum-on-premises-hana-servers)
3. [Process on Lemongrass Hosted HANA Servers](#process-on-lemongrass-hosted-hana-servers)

## Overview

Occasionally, there may be a request to reboot a customer's SLES server for maintenance or configuration changes. Linux (especially SLES) is a stable OS, so do not reboot without a valid reason. For example, rebooting due to high memory usage is not justified. Use this guide to safely restart HANA servers. Escalate any issues during the reboot process to the SAP Infrastructure team.

**IMPORTANT NOTE:** Ensure the customer is aware of the reboot and that a maintenance window has been scheduled before proceeding.

## Process on Huawei, AWS Direct, Azure, Ekkum, & On-Premises HANA Servers

### **Step 1: Connect to the HANA Server**
Connect to the HANA server using PuTTY and stop the SAP B1 Server Tools service unit

```bash
systemctl stop sapb1servertools
```

### **Step 2: Switch to HANA Database Admin User**
Switch to the HANA database admin user account

```bash
su - hdbadm
```

**IMPORTANT NOTE:** If you do not see the expected prompt, switch to a different user account. Common alternatives include:

![user_switch](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/user_switch.png)

```bash
su - ndbadm
su - seiadm
```

If neither works, check existing users with:

```bash
cat /etc/passwd
```

The SAP HANA Database System Administrator user is the correct user, which may be specific to the customer (e.g., `skyadm` for Skywire).

![user_info](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/user_info.png)

### **Step 3: Stop the HANA Database Engine**
Stop the HANA database engine and wait for the status to change to stopped

```bash
HDB stop
```

### **Step 4: Exit HDBADM User Session**
Exit the hdbadm user session and return to the root user

```bash
exit
```

### **Step 5: Reboot the Server**
Reboot the server

```bash
reboot
```

For electrical maintenance requests, use the shutdown command:

```bash
shutdown -h now
```

### **Step 6: Verify HANA is Running After Reboot**
After rebooting, both SAP B1 server tools and HANA should start automatically. Verify HANA is running

```bash
HDB info
```

If you do not see `hdb*` processes under the "sapstart" parent process, start the database engine manually:

```bash
HDB start
```

![hana_status](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/hana_status.png)

### **Step 7: Check SAP B1 Server Tools Status**
Verify that the SAP B1 server tools service is running

```bash
systemctl status sapb1servertools
```

See below an example of a healthy service status:

![service_status_2](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/service_status_2.png)

Press Ctrl + C keys to close out of the service status. If the service is not running, start it:

```bash
systemctl start sapb1servertools
```

### **Step 8: Check SAP Functionality**
Check SAP functionality by launching the SAP Business One client and clicking on the Change Company button. You should see the customer's databases loaded.

![change_company](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/change_company.png)

![company_db](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/company_db.png)

**IMPORTANT NOTE:** If you encounter a System Landscape Directory (SLD) error upon launching SAP B1, first try restarting the SAP B1 server tools process:

```bash
systemctl restart sapb1servertools
```

## Process on Lemongrass Hosted HANA Servers

### **Step 1: Log into Lemongrass B&O Portal**
Log into Lemongrass B&O portal and navigate to the customer's resources: AWS > Instances > HANA server Instance ID

![lemongrass_resources](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/lemongrass_resources.png)

### **Step 2: Stop SAP B1 Services**
Click on Ray Command, then stop SAP B1 services and wait for the process to finish

![ray_command](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/ray_command.png)

```bash
b1 stop -ns=dom0:HDB
```

### **Step 3: Stop HANA Services**
Open another Ray Command prompt, then stop HANA and wait for the process to finish

```bash
hana stop -ns=dom0:HDB
```

![hana_stop](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/hana_stop.png)

### **Step 4: Reboot the Server**
Click Action and select Action > Reboot and wait for the process to complete.

### **Step 5: Wait for SAP and HANA Services to Start**
Once the server has finished rebooting, wait about 10 to 15 minutes for SAP and HANA services to start. You will notice that the server's memory usage will start increasing rapidly; at some point, the memory usage will stop increasing, use this as an indicator that HANA has finished starting up.

### **Step 6: Test SAP Functionality**
Log into the customer's TS server and test SAP. Again, if you encounter an SLD error, first try restarting the SAP B1 service with Ray command:

```bash
b1 restart -ns=dom0:HDB
```

---