# Windows Firewall 🔥 (Provisioning Inbound & Outbound Rules)

## Table of Contents

1. [Overview](#overview)  
2. [Notes](#notes)  
3. [Inbound Rule Creation (Port-Based)](#inbound-rule-creation-port-based)  
4. [Outbound Rule Creation (Port-Based)](#outbound-rule-creation-port-based)  
5. [Service/Application and Port Information](#serviceapplication-and-port-information)

---

## Overview

This guide outlines how to create inbound and outbound firewall rules on Windows to allow specific applications or services. It also includes a table with potential reasons Mimecast might reject, bounce, hold, or defer an email, along with the corresponding policies or actions to resolve these issues.

---

## Notes

- **Windows Firewall should never be disabled**, except for temporary testing.
- Explicit inbound and outbound rules should be created for any application that requires them.
- Outbound rules are less common, as most ports are allowed outbound by default.

---

## Inbound Rule Creation (Port-Based)

1. Navigate to **Windows Defender Firewall with Advanced Security**.
2. Right-click on **Inbound Rules** and select **New Rule**.
3. Select **Custom Rule**.
4. Select **All Programs**.
5. Choose the **Protocol** (e.g., TCP 1433 for MS SQL). Remote ports can be left on default.
6. In the **Scope** settings, specify IPs that require access. For example, allow only the TS server by adding its IP. To allow the entire network, use `192.168.1.0/24`.
7. Select **Allow the Connection**.
8. For security, avoid allowing the rule on public networks; restrict it to Domain.
9. Name the firewall rule and provide a description, including a ticket or project number if possible.

---

## Outbound Rule Creation (Port-Based)

Outbound rules are less common, as most ports are allowed outbound by default. The following steps demonstrate how to create an outbound rule, using the inverse of the inbound example.

1. Navigate to **Windows Defender Firewall with Advanced Security**.
2. Right-click on **Outbound Rules** and select **New Rule**.
3. Select **Custom Rule**.
4. Select **All Programs**.
5. Choose the **Protocol** (e.g., TCP 1433 for MS SQL). Remote ports can be left on default.
6. Select **Allow the Connection** (outbound rules default to block).
7. For security, avoid allowing the rule on public networks; restrict it to Domain.
8. Name the firewall rule and provide a description, including a ticket or project number if possible.

---

## Service/Application and Port Information

| Service/Application | Port(s) |
| --- | --- |
| MS SQL | TCP 1433: Default SQL Server instance |
|  | UDP 1434: SQL Server Browser service |
|  | TCP 2383: SQL Server Analysis Services (if using) |
|  | TCP 4022: SQL Server Service Broker (if using) |
|  | TCP 135: For some administrative tasks (optional) |
|  | TCP Ports (49152–65535): Passive ports (sometimes required) |
| Sophos STAS | TCP 389/636: LDAP ports (generally open by default) |
|  | UDP 6677: Inbound Connector port |
|  | UDP 6060: Outbound Connector port |

---