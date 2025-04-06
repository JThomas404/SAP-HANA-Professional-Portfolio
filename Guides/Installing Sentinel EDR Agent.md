# Installing Sentinel EDR Agent

## Table of Contents

1. [Overview](#overview)
2. [Installation Steps](#installation-steps)

---

## Overview

Use this guide to install the Sentinel EDR agent on Linux servers and workstations. If you encounter any issues during the installation or registration process, please escalate to the SAP Infrastructure Support team.

---

## Installation Steps

**Step 1:** Retrieve the EDR agent installation package and registration token/key for the specified customer/server. Ensure that the install package has `x86_64` in the name (not `aarch64`).

![installation_package](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/installation_package.png)

**IMPORTANT NOTE:**

- Use the `.rpm` installer for RPM-based systems (e.g., Suse, RHEL, Fedora).
- Use the `.deb` installer for Debian-based systems (e.g., Ubuntu).

**Step 2:** Sign into the customer's Terminal Server. Copy the installation package to the desktop. Open both PuTTY and WinSCP, and connect to the Linux server using the root credentials from Pass Portal.

**Step 3:** Transfer the retrieved installation file from the Terminal Server to the `/opt` directory on the Linux server using WinSCP.

**Step 4:** Navigate to the `/opt` directory in PuTTY and list the contents:

```bash
cd /opt
ls -l
```

**Step 5:** Install the package:

```bash
rpm -ivh <install file>.rpm
```

**Step 6:** Verify the Sentinel agent's program version after installation:

```bash
sentinelctl version
```

**Step 7:** Start and enable the agent's service, setting it to start automatically when the server boots:

```bash
sentinelctl control start && sentinelctl control enable
```

**Step 8:** Register the agent using the token/key:

```bash
sentinelctl management token set <token string>
```

**Step 9:** Verify the agent's running status:

```bash
sentinelctl control status
```

--- 