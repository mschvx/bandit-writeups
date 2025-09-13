Level 21 → Level 22
Steps Taken
1. Understanding the Task

A program is running automatically at regular intervals from cron. Look in /etc/cron.d/ for the configuration and see what command is being executed.

2. Checking /etc/cron.d for the cron job

Commands I ran:

cd /etc/cron.d
ls -la
cat cronjob_bandit22


Observed contents:

@reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
* * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null


The * * * * * means the command runs every minute.

3. Inspecting the referenced script

Commands I ran:

cd ~
cat /usr/bin/cronjob_bandit22.sh


Reading /usr/bin/cronjob_bandit22.sh revealed the information that contained the password for the next level.

From this, I was able to determine the password for the next level.
