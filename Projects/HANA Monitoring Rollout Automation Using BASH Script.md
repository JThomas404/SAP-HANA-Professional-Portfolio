# HANA Monitoring Rollout Automation Using BASH Script

## Table of Contents

1. [Overview](#overview)
2. [Steps to Complete](#steps-to-complete)

---

### Overview

The HANA Monitoring script is used to collect metrics from HANA for viewing in N-central. Currently, the script retrieves the following information:

- SAP B1 FP Version information
- HANA License information
- HANA Memory Usage
- HANA Sizing Query

---

### Steps to Complete

#### Step 1: Download the HANA Monitoring script

- Download the script.

[hana_monitoring.zip](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/hana_monitoring.zip)

#### Step 2: Upload the HANA Monitoring package

- Upload the zip file to the customer's TS server and copy it to the `/opt` directory on the HANA server using [WinSCP – Transferring Files to Linux](WinSCP-Transferring-Files-to-Linux.md). For instructions, refer to this guide.

---

**IMPORTANT NOTE:**

- For AWS Direct servers, first upload the zip to `/home/ec2-user` using WinSCP, then switch to root and move the file:

    ```bash
    mv /home/ec2-user/hana_monitoring.zip /opt
    ```

- For Ekkum servers, upload to `/home/snsys` and then move:

    ```bash
    mv /home/snsys/hana_monitoring.zip /opt
    ```

- For Huawei Cloud and on-premises servers, proceed with [step 2](#step-2-upload-the-hana-monitoring-package) after uploading to `/opt`.

---

#### Step 3: Extract and execute the package

- Connect to the HANA server via PuTTY and run:

    ```bash
    cd /opt && unzip hana_monitoring.zip && cd hana_monitoring && ./setup.sh
    ```

- Enter the HANA SYSTEM user password when prompted.

---

### Successful Output

After executing the `setup.sh` script, the successful output will vary depending on whether the script has already been implemented or not. Please ensure that you check the output messages for confirmation of successful execution. If there are any errors, they will be displayed, indicating what needs to be addressed.

![successful-output](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/successful-output.png)

#### Step 4: Open HANA Studio

- Open HANA Studio on the server and connect to the Tenant DB using the HANA SYSTEM credentials.
- If the sizing query is implemented, run only the first three scripts. If it's a new setup, run all four. Open each script using WinSCP and execute in HANA Studio.

#### Step 5: Create the stored procedures in HANA

- After running the `setup.sh` script, there will be 4 SQL scripts under the `/seidor/scripts` directory: 
    - `SN_SP_FP_VERSION`
    - `SN_SP_MEMORY_USAGE`
    - `SN_SP_LICENSE_CHECK`
    - `SN_SP_SIZING_QUERY`

    - If the sizing query has already been implemented, you will only run the `SN_SP_FP_VERSION`, `SN_SP_MEMORY_USAGE`, and `SN_SP_LICENSE_CHECK` stored procedures.
    - If the sizing query has not yet been implemented (new setups), then you need to run all four stored procedures.

- Navigate to the `/seidor/scripts` directory using WinSCP and double click on the SQL scripts to open them with WinSCP's text editor.
- Click on the Tenant DB in HANA Studio > Open 4 new SQL console windows > Copy and paste the contents of each script into a SQL console > Run each script by pressing the green execute button.
  
  ![sql-console](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/sql-console.png)

#### Step 6: Execute the monitoring script

- Run the monitoring script to retrieve outputs:

    ```bash
    cd /seidor/scripts
    ./monitoring.sh
    ```

- Successful output will vary; errors will appear if the stored procedures were not created as per [Step 5](#step-5-create-the-stored-procedures-in-hana).

    ![monitoring-script-output](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/monitoring-script-output.png)

#### Step 7: Verify log outputs

- Open a new command on the server and connect to the log output directory on the HANA server using the UNC path.

    ![log-output-directory](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/log-output-directory.png)

#### Step 8: Check log files

- Open each highlighted log in a web browser to verify values in XML format. Ensure there are no errors or missing information.

#### Step 9: Copy logs for NOC

- If the output is correct, create a folder for each customer on your local computer and copy the logs there. Send the logs to the NOC team for threshold configuration in [N-central](https://www.bing.com/aclk?ld=e8qnjPCUdXUCcguHhsnjspPDVUCUxYY4nUQP6MQc2zp6FQt8hdT3dCexea1OZpmu_Tx6Ns6CAMYJmMsGAoOy17jUm_vtCcWBt5pvvYY-26COjRWsKhiwAK7q6QCrdXwS0wLBEpa82qwoC-0PZjgnQ6N43CR1uBQqDSSos4JgKa7R-3t2lneNYK_LL02aAYepA1vndhwg&u=aHR0cHMlM2ElMmYlMmZ3d3cubi1hYmxlLmNvbSUyZmxwJTJmbi1jZW50cmFsLXRyaWFsJTNmdXRtX21lZGl1bSUzZGNwYyUyNnV0bV9zb3VyY2UlM2RiaW5nLWJyYW5kJTI2dXRtX2NhbXBhaWduJTNkcm0tZ2xibC1sdC1kZ2QtYmluZ19icmFuZC0yMDIxLTAxLTAxJTI2dXRtX3Rlcm0lM2RuY2VudHJhbF9rd2QtNzE5NTAxMDg2MDAxOTklM2FhdWQtODExMjk0ODU1JTNhbG9jLTE2OF9lXyUyNnV0bV9jb250ZW50JTNkb181ODA0MDc5ODFfMTE1MTE5MDQzNzU2NDM0OSUyNmdjbGlkJTNkMzg1YzEwNjc5ZjYzMTNiMzgxYzQ3NzhiZTgxYzRhNzUlMjZnY2xzcmMlM2QzcC5kcyUyNm1zY2xraWQlM2QzODVjMTA2NzlmNjMxM2IzODFjNDc3OGJlODFjNGE3NQ&rlid=385c10679f6313b381c4778be81c4a75&ntb=1) RMM.

    ![copy-logs-noc](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/copy-logs-noc.png)

---