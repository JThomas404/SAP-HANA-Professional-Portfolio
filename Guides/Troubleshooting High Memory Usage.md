# Troubleshooting High Memory Usage

## Table of Contents

1. [Overview](#overview)
2. [Example Scenario](#example-scenario)
3. [Troubleshooting Steps](#troubleshooting-steps)
4. [Useful Commands](#useful-commands)
5. [Checking for Out-of-Memory Events](#checking-for-out-of-memory-events)
6. [Troubleshooting High Memory Usage on Lemongrass Servers](#troubleshooting-high-memory-usage-on-lemongrass-servers)
7. [Summary](#summary)

---

## Overview

HANA is a high-performance in-memory database management system, meaning all information is stored directly in memory, allowing database transactions to be executed rapidly. About 90% of total physical memory on HANA servers is reserved for HANA processes, which typically have the prefix **hdb**. Use this guide to troubleshoot common memory issues on HANA servers. Note that rebooting a server to release memory is not a valid solution; all steps must be completed before considering a reboot.

---

## Example Scenario

- **Service Ticket #740884 - Performance Monitoring Check - Memory: FS-SYSTEMS > FS-SYSTEMS > FSSHANAB1**

![example_service_ticket_memory_check](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/example_service_ticket_memory_check.png)

**Internal Notes:**

- Logged into the SLES Portal.
- Navigated to the device.
- Noted that SWAP memory is full.

![swap_memory_full](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/swap_memory_full.png)

- Logged into the server via PuTTY.
- Cleared cache (note: this does not affect SWAP memory).

![clearing_cache](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/clearing_cache.png)

- Arranged for a service restart for the device.
- Confirmed with the customer to proceed with the reboot after hours.
- Rebooted the HANA server.

![hana_server_reboot](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/hana_server_reboot.png)

![hana_server_reboot_2](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/hana_server_reboot_2.png)

![sap_application_functioning](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/sap_application_functioning.png)

![companies_tab](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/companies_tab.png)

---

## Troubleshooting Steps

**Step 1:** Determine if it is a first-time alert or a recurring alert. If the alert recurs frequently, there is likely a problem. Check the Outage History tab for the server in alert.

![outage_history_tab](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/outage_history_tab.png)

**Step 2:** Check if any test/development schemas are loaded into memory from HANA Studio. Log a ticket with the responsible Seidor SAP Support team to determine if these schemas can be dropped to free up memory.

![hana_studio_memory_schemas](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/hana_studio_memory_schemas.png)

**Step 3:** Use commands in the Useful Commands section to gather information about the server's memory usage. This applies to HANA hosted on Huawei, AWS Direct, Azure, and Ekkum.

**Step 4:** Refer to the SAP EDF Backend High Resource Usage Repo if the SAP EDF backend service is consuming a lot of memory.

**Step 5:** Check for OOM events as described in the Checking for Out-of-Memory Events section.

**Step 6:** Escalate to the SAP Infrastructure Support team if none of the above steps resolve the memory alert. Ensure you have executed all steps and collected relevant information before escalating.

---

## Useful Commands

- **View the server's overall memory and swap usage:**
    
    ```bash
    free -hl
    ```

- **Analyze the output of `free`:**
The output shows total memory usage, but remember that buffers can be freed by the OS to handle additional requests.
    
![free_command_output](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/free_command_output.png)

- **View live memory usage of processes using the `top` utility:**
    
    ```bash
    top     # Press M to sort by %MEM
    ```

- **View static memory usage sorted in descending order:**
    
    ```bash
    top -n1 -o %MEM
    ```

- **List the top 10 most memory-intensive processes:**
    
    ```bash
    ps aux --sort -%mem | head -11
    ```

---

## Checking for Out-of-Memory Events

Linux has a built-in mechanism called OOM killer (Out-of-Memory). If a process uses excessive memory for a long time, the kernel will kill that process to prevent system memory exhaustion. The OOM killer typically targets HANA's **hdbindexserver** process.

**To check for OOM events:**

```bash
journalctl | grep oom
```

or

```bash
cat /var/log/messages | grep oom
```

If no output is returned, there are no recent OOM events. Inform the SAP Infrastructure Support team if OOM events are found.

---

## Troubleshooting High Memory Usage on Lemongrass Servers

**Step 1:** Navigate to the customer's HANA server in the Lemongrass B&O portal to monitor processes and sort memory usage.

![lemongrass_monitor_processes](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/lemongrass_monitor_processes.png)

**Step 2:** Identify any non-HANA processes consuming large amounts of memory, such as Sophos AV, which can significantly affect available memory.

**Step 3:** If Sophos is using excessive memory, log a ticket with SkyOne Support via the SkyOne Portal.

**Step 4:** Notify the SAP Infrastructure Support team for further preventative measures.

---

## Summary

- Check the Outage History to identify recurring alerts.
- Generate a memory usage report in N-sight.
- Check for loaded test/development schemas in HANA Studio.
- Use the Useful Commands to understand overall memory usage.
- Ensure the SAP EDF Backend service does not use excessive memory.
- Check for any OOM events in system logs.
- Escalate to the SAP Infrastructure Support team after completing all steps if the problem is unresolved.

---