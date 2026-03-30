# Vlc Audit - Script Execution Outputs

This document contains simulated terminal outputs for the 5 audit scripts.

---

## 1. System Identity Report (`01-identify.sh`)
```bash
sulabhkumar0710@ubuntu-server:~/Vlc$ ./01-identify.sh
================================================================================
                   Vlc AUDIT - SYSTEM IDENTITY                    
================================================================================
Linux Distribution: Ubuntu 22.04.3 LTS
Kernel Version:     5.15.0-89-generic
Current User:       sulabhkumar0710
Home Directory:     /home/sulabhkumar0710
System Uptime:      up 2 hours, 45 minutes
Current Date/Time:  Mon Mar 30 2026 19:20:52 GMT+0000 (Coordinated Universal Time)
--------------------------------------------------------------------------------
Message: This system runs on Open Source software, providing freedom to study, change, and distribute.
================================================================================
```

---

## 2. FOSS Package Inspector (`02-packages.sh`)
```bash
sulabhkumar0710@ubuntu-server:~/Vlc$ ./02-packages.sh
================================================================================
                   Vlc AUDIT - PACKAGE INSPECTOR                 
================================================================================
Status: vlc is INSTALLED on this ubuntu system.
Version: 3.0.18
--------------------------------------------------------------------------------
FOSS Philosophy Notes:
 - VLC: VLC embodies the principle of software freedom by providing a universal media player without DRM.
 - Git: Git enables collaborative development and transparent history, core to open source.
 - Firefox: Firefox champions privacy and open standards on the web.
 - GIMP: GIMP offers a free alternative to proprietary image editors, encouraging creative freedom.
================================================================================
```

---

## 3. Disk and Permission Auditor (`03-auditor.sh`)
```bash
sulabhkumar0710@ubuntu-server:~/Vlc$ ./03-auditor.sh
================================================================================
                   Vlc AUDIT - DISK AND PERMISSION AUDITOR       
================================================================================
Directory                     Size(KB)   Permissions  Owner
--------------------------------------------------------------------------------
/etc                          124560     drwxr-xr-x   root
/var/log                      84230      drwxr-xr-x   syslog
/usr/share/vlc                21540      drwxr-xr-x   root
/etc/vlc                      120        drwxr-xr-x   root
/usr/lib/vlc                  35800      drwxr-xr-x   root
/var/lib/vlc                  6400       drwxr-xr-x   root
================================================================================
```

---

## 4. Log File Analyzer (`04-logs.sh`)
```bash
sulabhkumar0710@ubuntu-server:~/Vlc$ ./04-logs.sh /var/log/syslog error
================================================================================
                   Vlc AUDIT - LOG ANALYZER                     
================================================================================
Log file examined : /var/log/syslog
Keyword searched  : error
Total matching lines: 3
--------------------------------------------------------------------------------
Last 5 matching entries:
Mar 30 19:10:12 ubuntu-server vlc[1234]: error: failed to open video decoder
Mar 30 19:12:45 ubuntu-server vlc[1234]: error: network timeout while streaming
Mar 30 19:18:07 ubuntu-server vlc[1234]: error: unsupported codec encountered
================================================================================
```

---

## 5. Open Source Manifesto Generator (`05-manifesto.sh`)
```bash
sulabhkumar0710@ubuntu-server:~/Vlc$ ./05-manifesto.sh
1) What is your favorite open‑source project? Linux Kernel
2) Why do you support open source? Because it empowers users with transparency and control.
3) What is your personal goal related to open source? contribute patches to improve hardware compatibility
Manifesto has been appended to sulabhkumar0710_manifesto.txt
```
