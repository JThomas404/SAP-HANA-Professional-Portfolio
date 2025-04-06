# Create GPO for Changing Language & Date Format

## Table of Contents

1. [Overview](#overview)  
2. [Steps to Complete](#steps-to-complete)

---

## Overview

This guide explains how to create a Group Policy Object (GPO) in Group Policy Editor to change the language locale or date format.

---

## Steps to Complete

**Step 1: Launch Group Policy Management Console**  
Log on to the customer's domain controller and launch the **Group Policy Management** console under **Tools** in Server Manager.

![gpo-server-manager-tools.png](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/gpo-server-manager-tools.png)

---

**Step 2: Create a New GPO**  
Expand the customer's domain name, right-click on the **SVD Users OU**, and select **"Create a GPO in this domain and link it here."**  
Name the GPO appropriately (e.g., _"Changing Date Format to UK"_).

![create-gpo-link.png](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/create-gpo-link.png)

---

**Step 3: Edit the GPO**  
Right-click on the newly created GPO and select **Edit**. Navigate to:

```
User Configuration > Preferences > Control Panel Settings
```

Right-click on **Regional Options**, then select **New > Regional Options**.

---

**Step 4: Set Language to English (UK)**  
If the language is set to **English (US)**, change it to **English (UK)**.  
Press **F5** on your keyboard after changing the value; the line under the setting will change from red to green (red = current, green = enforced).

![regional-options-language.png](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/regional-options-language.png)

---

**Step 5: Set Date Format to UK Standard**  
For UK users, change the date format to **dd/mm/yyyy**.  
Navigate to the **Date** tab and update the **short date format**. Press **F5** to enforce the new setting (red line turns green), then select **Apply**.

![regional-options-date-format.png](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/regional-options-date-format.png)

---

**Step 6: Force Group Policy Update**  
Return to the **Group Policy Management** console. Right-click on the **SVD Users OU**, then select **Group Policy Update** to trigger a policy refresh across all users.  
This is equivalent to running:

```bash
gpupdate /force
```

---

**Step 7: Apply Policy Changes**  
Request users to **sign out and sign back in** for the new regional settings to apply.

---