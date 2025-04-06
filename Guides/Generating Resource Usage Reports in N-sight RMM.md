# Generating Resource Usage Reports in N-sight RMM

## Table of Contents

1. Overview  
2. Steps to Complete

---

### Overview

This guide explains how to generate a resource usage report from N-sight RMM, specifically focusing on creating a memory usage report. Resource usage reports help identify when a server's memory, disk, or CPU usage has breached warning thresholds and allow you to observe usage trends over time.

---

### Steps to Complete

**Step 1: Navigate to Memory Check**  
Click on the link next to the memory check of the server that is in alert.

![navigate_memory_check](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/navigate_memory_check.png)

**Step 2: View Report**  
Verify that the server's memory usage threshold is breaching. Click on **View Report**.

![view_report](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/view_report.png)

**Step 3: Select Report Type**  
Select **Memory Utilisation** only to generate both a 24-hour and an 8-day memory usage report simultaneously. Choose the report relevant to the issue you are troubleshooting.

![select_memory_utilisation](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/select_memory_utilisation.png)

**Step 4: Analyse Report**  
Review the report. In the example below, note that the server's memory usage has remained consistently above the warning threshold over the last 24 hours, with a sudden spike in memory usage.

![memory_report_analysis](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/memory_report_analysis.png)

---