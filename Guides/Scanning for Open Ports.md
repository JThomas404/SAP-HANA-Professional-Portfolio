# Scanning for Open Ports

## Table of Contents

1. [Overview](#overview)
2. [Steps to Complete](#steps-to-complete)

---

## Overview

Scanning for open ports is crucial for assessing the security of a server. This guide outlines the steps to identify open ports using built-in tools and third-party utilities.

---

## Steps to Complete

**Step 1:** List all open ports on the local server using the `ss` utility (available natively on Linux):

```bash
ss -tul | grep LISTEN | sort
```

**Step 2:** (Optional) If you want to use `nmap`, which is not available by default, ensure it is installed first. Then, list all open ports on the local server:

```bash
nmap -p- localhost
```

---