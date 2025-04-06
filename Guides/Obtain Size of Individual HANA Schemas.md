# Obtain Size of Individual HANA Schemas

## Table of Contents

1. [Overview](#overview)
2. [Steps to Complete](#steps-to-complete)

---

### Overview

This guide explains how to view the size of each individual schema that is loaded into memory from HANA Studio. This information can be useful for identifying any test schemas and assessing their impact on resources.

---

### Steps to Complete

**Step 1:** Connect to the Tenant DB in HANA Studio using the **SYSTEM** user.

**Step 2:** Double-click on the tenant DB **HDB@HDB** to open the Administration console and navigate to **System Information**.

**Step 3:** Expand the system folder and double-click on **Schema Size of Loaded Tables** to execute the statement.

![schema_size_loaded_tables](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/schema_size_loaded_tables.png)

**Step 4:** Click on the **Schema Size** tab to sort the schemas in ascending or descending order. The size of each schema will be displayed in megabytes.

![schema_size_tab](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/schema_size_tab.png)

--- 