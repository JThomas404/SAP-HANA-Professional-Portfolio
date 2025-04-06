# Troubleshooting High CPU Usage

## Table of Contents

1. [Overview](#overview)
2. [Useful Commands](#useful-commands)
3. [Checking CPU Usage in HANA Studio](#checking-cpu-usage-in-hana-studio)

---

## Overview

High CPU usage alerts on SLES/HANA servers are not very common but can still occur. Refer to the [Useful Commands](#useful-commands) section below to gauge a HANA server's CPU usage.

---

## Useful Commands

- **View live CPU usage of processes using the `top` utility (similar to Task Manager on Windows):**
    
    ```bash
    top    # Top sorts by %CPU by default
    ```
    
- **View static CPU usage using the `top` utility:**
    
    ```bash
    top -n1 -o %CPU
    ```
    
**IMPORTANT NOTE:**

If you find that `top` shows a particular process using over 100% of the CPU's time, it does not necessarily mean that the CPU is being maxed out. Press `1` while `top` is running to view CPU usage per core.

us = user processes  
sy = system processes  
id = processor idle time

![CPU Usage Example](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/cpu_usage_example.png)

- **Filter CPU usage by a particular process' name:**
    
    ```bash
    top -p $(pgrep process_name)      # Replace process_name with the actual name of the process
    ```

- **List the top 10 most CPU-intensive processes and sort them in descending order:**
    
    ```bash
    ps aux --sort -%cpu | head -11
    ```

---

## Checking CPU Usage in HANA Studio

**Step 1:** Open HANA Studio and double-click on **SYSTEMDB@HDB**.

**Step 2:** On the Overview tab, you will see HANA's overall CPU usage in real-time. The CPU counter will clearly be in the red if a particular HANA process is maxing out the CPU.

![HANA Studio CPU Overview](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/hana_studio_cpu_overview.png)

---