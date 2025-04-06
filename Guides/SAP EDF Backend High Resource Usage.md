# SAP EDF Backend High Resource Usage

## Table of Contents

1. [Overview](#overview)
2. [Troubleshooting Steps](#troubleshooting-steps)

## Overview

There is a known bug in the SAP EDF backend service on HANA servers that causes excessive memory usage. Use this guide to identify the issue and refer to the [Troubleshooting High Memory Usage](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/Guides/Troubleshooting%20High%20Memory%20Usage.md) for more info.

## Troubleshooting Steps

### Step 1: Check Memory Usage

1. Log into the HANA server via PuTTY.
2. Execute the following command to retrieve a list of the top 10 most memory-intensive processes running on the server, sorted in descending order:
    
    ```bash
    ps aux --sort=-%mem | head -n 11
    ```
    
    You should be able to see that the EDS process is using 31.2% of the server's total memory.
    
    ![high_memory_usage_eds_process](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/high_memory_usage_eds_process.png)

### Step 2: Restart the EDF Service

To release the used memory, restart the EDF service using the command:

```bash
systemctl restart sapb1edfbackend
```

---