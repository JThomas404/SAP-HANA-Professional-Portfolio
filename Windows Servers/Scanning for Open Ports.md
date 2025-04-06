# Scanning for Open Ports

## Table of Contents

1. [Overview](#overview)  
2. [Useful Commands](#useful-commands)

---

## Overview

This guide provides instructions for testing connectivity to network ports on Windows Servers using PowerShell. SAP consultants often request the opening of new ports on servers to facilitate third-party integrations and other services within SAP.

---

## Useful Commands

### 1. Check a Specific Port on the Local Machine  
Use this command to verify if a specific port (e.g., SSH port 22) is open on your local machine:

```powershell
Test-NetConnection -Computer localhost -Port 22
```

---

### 2. Check a Specific Port on a Remote Host  
Replace `<remote_host>` with the server’s public IP address or hostname to test if a specific port is open remotely:

```powershell
Test-NetConnection -Computer <remote_host> -Port 3389
```

---

### 3. List All Open Ports on the Local Machine  
Use this command to display all open TCP ports currently in the LISTEN state on your machine:

```powershell
Get-NetTcpConnection -State Listen | Select-Object LocalAddress, LocalPort | Sort-Object -Property LocalPort | Format-Table
```

---

### 4. Scan a Range of IPs in a Local Subnet for a Specific Port  
Test if a port (e.g., RDP 3389) is open on multiple hosts in your subnet (e.g., 192.168.1.100–150):

```powershell
foreach ($ip in 100..150) {Test-NetConnection -Port 3389 -InformationLevel "Detailed" 192.168.1.$ip}
```

---