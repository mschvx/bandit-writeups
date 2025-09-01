# Level 19 → Level 20

---

## Steps Taken

### 1. Understanding the Task
The home directory contains a setuid binary that must be used to gain access to the next level. Executing it without arguments shows how to use it. The password for the next level is stored in `/etc/bandit_pass/bandit20`.

---

### 2. Attempting Direct Access
I tried accessing the password file directly:

```bash
cd /etc/bandit_pass
cat bandit20
````

This returned **permission denied** because the file is owned by another user.

---

### 3. Using the setuid Binary

In the home directory, there is a setuid binary `bandit20-do`. Since `bandit20` is the owner of the password file, I used the binary to execute a command as that user:

```bash
./bandit20-do cat /etc/bandit_pass/bandit20
```
From this, I was able to determine the password for the next level.

