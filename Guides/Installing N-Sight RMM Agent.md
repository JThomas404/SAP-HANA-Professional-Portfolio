# Installing N-Sight RMM Agent

## Table of Contents

1. [Overview](#overview)
2. [Installation Steps](#installation-steps)

---

## Overview

Use this guide to install the N-Sight RMM agent on Linux servers.

---

## Installation Steps

#### **Step 1:** Download the agent from N-Sight.

---

#### **Step 2:** Upload the `rmmagent-2.1.0-1.x86_64.rpm` installation package to the `/opt` directory on the SLES server and install it using:

```bash
rpm -ivh rmmagent-2.1.0-1.x86_64.rpm
```

---

#### **Step 3:** Ensure that the agent’s service is started (the service should start automatically following installation):

```bash
systemctl status rmmagent
```

![service_status](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/service_status.png)

---

#### **Step 4:** Execute the `rmmagentd` script located under `/usr/local/rmmagent` to register the agent:

```bash
/usr/local/rmmagent/rmmagentd register
```

---

#### **Step 5:** Enter your N-Sight credentials (username and password). Only certain staff have the permissions to register servers in N-Sight. Check with The NOC Team Manager to confirm your account's permissions.

---

#### **Step 6:** Select the customer by entering the client number. For example, enter `73` if you are installing the agent for Richmond Defence Systems.

![customer_selection](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/customer_selection.png)

---

#### **Step 7:** Select the site number by entering `1` and pressing Enter.

![site_selection](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/site_selection.png)

---

#### **Step 8:** Leave the Device Description blank by simply pressing Enter, then type `yes` to continue registration when prompted.

---

#### **Step 9:** The server will be onboarded into N-Sight automatically if the above process completes without error.

---