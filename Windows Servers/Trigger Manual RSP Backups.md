# Trigger Manual RSP Backups

## Table of Contents

1. [Overview](#overview)  
2. [Steps to Complete](#steps-to-complete)

---

## Overview

This guide outlines how to trigger a manual RSP backup. Creating manual backups is useful when troubleshooting RSP backup failures and verifying whether the tenant database is backing up successfully.

---

## Steps to Complete

### Step 1: **Access Backup Management**

1. Log into the **Remote Support Platform (RSP)**.  
2. Navigate to **Configuration** > **Backup Management**.

![Access Backup Management](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/Access_Backup_Management.png?raw=true)

---

### Step 2: **Select Backup Strategy**

1. Go to **Backup Strategy**.  
2. Choose **Instance Backup: Daily**.

![Select Backup Strategy](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/Select_Backup_Strategy.png?raw=true)

---

### Step 3: **Configure Backup Settings and Trigger Backup**

1. Ensure the Backup Strategy settings are configured as needed.  
2. Click **Trigger Instance Backup Now**.

![Trigger Backup Now](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/Trigger_Backup_Now.png?raw=true)

---

### Step 4: **Monitor Backup Progress**

- Be aware that **RSP does not display any progress** during the backup process.  
- Allow some time, then verify the backup result under backup history or logs.

---