# Level 22 → Level 23

---

## Steps Taken

### 1. Understanding the Task

A program is running automatically at regular intervals from cron. Look in `/etc/cron.d/` for the configuration and see what command is being executed. The script is intentionally easy to read — executing it will show debug output.

---

### 2. Checking `/etc/cron.d` for the cron job

Commands I ran:

```bash
cd /etc/cron.d
ls -la
cat cronjob_bandit23
```

Observed contents (schedule shown with `* * * * *` meaning every minute):

```text
* * * * * bandit23 /usr/bin/cronjob_bandit23.sh &> /dev/null
```

---

### 3. Reading the script referenced by cron

Commands I ran:

```bash
cat /usr/bin/cronjob_bandit23.sh
```

Script contents:

```bash
#!/bin/bash

myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

cat /etc/bandit_pass/$myname > /tmp/$mytarget
```

---

### 4. Running and testing the script

I checked `whoami`:

```bash
whoami
# output: bandit22
```

I executed the script:

```bash
sh /usr/bin/cronjob_bandit23.sh
```

This created `/tmp/<md5-of-"I am user bandit22">` which contained the password for `bandit22`. Since the script uses `whoami`, it copied the current user’s password file.

---

### 5. Forcing the script to target bandit23

I modified the command to hardcode `myname` as `bandit23` by running the echo line with `myname=bandit23` so the md5 target matched `bandit23` and the script would copy `/etc/bandit_pass/bandit23`:

```bash
myname=bandit23
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)
echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"
cat /etc/bandit_pass/$myname > /tmp/$mytarget
```

This created `/tmp/<md5-of-"I am user bandit23">` which contained the password for `bandit23`.

From this, I was able to determine the password for the next level.
