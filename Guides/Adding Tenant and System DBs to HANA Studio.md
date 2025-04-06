# Adding Tenant and System Databases to HANA Studio

## Table of Contents
1. [Overview](#overview)  
2. [Adding the System Database](#adding-the-system-database)  
3. [Adding the Tenant Database](#adding-the-tenant-database)

---

## Overview

At times, you may find that only one database—or none at all—is visible in HANA Studio. Ultimately, **two databases** should be visible:

- The System Database (named **SYSTEMDB@HDB**)  
- The Tenant Database (named **HDB@HDB**)

Use this guide to add both databases to HANA Studio.

---

## Adding the System Database

**Step 1:** Click the **Add System** button in HANA Studio, as shown below.

![Add_System_Button](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/raw/main/images/Add_System_Button.png)

**Step 2:** Enter the System Database details:

- **Hostname:** The HANA server’s local hostname or IP address (hostname is preferred).  
- **Instance Number:** `00` in almost all cases.  
- **Select:** *Multiple Containers* and *System Database*.  
- **Description:** Enter **System DB**, then click **Next**.  
- **Credentials:** Enter the HANA `SYSTEM` username and password (available in Pass Portal), then click **Finish**.  

![System_DB_Configuration](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/raw/main/images/System_DB_Configuration.png)

---

## Adding the Tenant Database

**Step 3:** Repeat the same process for the Tenant Database, using the following details:

- **Hostname:** The HANA server’s local hostname or IP address.  
- **Instance Number:** `00` in almost all cases.  
- **Select:** *Multiple Containers* and *Tenant Database*.  
- **Description:** Enter the name of the tenant database (typically **HDB**).  
- **Credentials:** Enter the HANA `SYSTEM` username and password, then click **Finish**.  

![Tenant_DB_Configuration](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/raw/main/images/Tenant_DB_Configuration.png)

---