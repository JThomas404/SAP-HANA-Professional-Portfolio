# HANA Monitoring - Manual Implementation

**Table of Contents**

1. [Configure the Monitoring Script](#configure-the-monitoring-script)  
2. [Update the Configuration File](#update-the-configuration-file)  
3. [Share the Log Output Directory](#share-the-log-output-directory)  
4. [Create Scheduled Tasks](#create-scheduled-tasks)  
5. [Configure the N-Central Probe](#configure-the-n-central-probe)  
6. [Configure N-Central Monitoring](#configure-n-central-monitoring)  

---

## Configure the Monitoring Script

1. **Upload and unzip the attached zip file** containing the scripts to the root folder of the HANA server.
2. **Obtain the HANA server's IP address**:

    ```bash
    ip a
    ```

3. **Locate the hdbsql utility**. It is typically found in one of these locations:
    - `/hana/shared/HDB/hdbclient/hdbsql`
    - `/usr/sap/hdbclient/hdbsql`
    
4. **Edit the monitoring script**:

    ```bash
    vi /seidor/scripts/monitoring.sh
    ```

5. Press **`i`** to insert mode and make the following changes:
    - Replace the `HANA_HOST` variable with the HANA server’s IP address.
    - Replace the `HDBCLIENT` variable with the path to the `hdbsql` executable.

6. **Save and exit**:
    - Press `Esc`, then type `:wq` and hit Enter.

---

## Update the Configuration File

1. **Edit the configuration file**:

    ```bash
    vi /seidor/scripts/hana.conf
    ```

2. Press **`i`** to insert mode and replace the password value with the HANA SYSTEM user password from Pass Portal.
3. **Save and exit**:
    - Press `Esc`, then type `:wq`.
4. **Change the permissions** of the configuration file:

    ```bash
    chmod 600 /seidor/scripts/hana.conf
    ```

---

## Share the Log Output Directory

1. **Edit the Samba configuration file**:

    ```bash
    vi /etc/samba/smb.conf
    ```

2. Press **`i`** to insert mode and add the following configuration:

    ```
    [monitoring]
        path = /seidor/monitoring
        writeable = yes
        browseable = yes
        guest ok = yes
        read only = no
    ```

3. **Save and exit**:
    - Press `Esc`, then type `:wq`.

4. **Restart the Samba service**:

    ```bash
    systemctl restart smb
    ```

5. **Verify access** from the customer's TS server using the UNC name:

    ```
    \\<hostname>\monitoring
    ```

6. **Log into HANA Studio** and open a new SQL console window. Copy and execute the SQL queries:
    - `SN_SP_SIZING_QUERY`
    - `SN_SP_TODAYS_BACKUP_HISTORY`

7. **Run the monitoring script**:

    ```bash
    ./monitoring.sh
    ```

8. **Check the log output**:  
   Navigate to `/seidor/monitoring` and view the output of `SN_SP_SIZING_QUERY_{timestamp}.xml`.

---

## Create Scheduled Tasks

1. **Edit the cron jobs**:

    ```bash
    crontab -e
    ```

2. Press **`i`** to insert mode and add the following lines:

    ```bash
    @hourly /seidor/scripts/monitoring.sh
    @weekly /seidor/scripts/cleanup.sh
    ```

3. **Save and exit**:
    - Press `Esc`, then type `:wq`.

4. **Verify cron execution** to ensure the monitoring script runs every hour.

---

## Configure the N-Central Probe

1. **Create a new user** named `SEI_PRB` in Active Directory under the Service Accounts OU.

![create_sei_prb_user](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/create_sei_prb_user.png)

2. **Add the SEI_PRB user to the Domain Admins group**.
3. **Download the Windows Probe** in N-central:
    - Go to the customer > Actions > Download Agent/Probe.

![download_probe](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/download_probe.png)

4. **Upload and install the probe** on the customer’s TS server:
    - Leave the Proxy Server empty.
    - Select Domain User and enter the domain name and SEI_PRB credentials.

![upload_probe](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/upload_probe.png)

5. **Grant Logon as Service privileges** to the user.

![grant_logon_as_service](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/grant_logon_as_service.png)

6. Enter the customer's name as Discovery Name and enter the IP range of the network and press next.

![ip_range_discovery](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/ip_range_discovery.png)

7. Leave the Advanced Discovery Details default and press next to proceed with the installation. Press OK if prompted to automatically close applications.

---

## Configure N-Central Monitoring

1. **Go to the TS server in N-central**.

![ncentral_ts_server](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio/blob/main/images/ncentral_ts_server.png)

2. **Select the Monitoring Tab**.
3. **Update the checks**:
    - Click the up arrow next to the selected checks to change the value from 0 to 1.

---
