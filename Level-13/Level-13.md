# Level 13 → Level 14

---

## Steps Taken

### 1. Understanding the Task
The password for the next level is stored in `/etc/bandit_pass/bandit14` and can only be read by user `bandit14`.  
For this level, instead of giving the password directly, a private SSH key is provided to log in as `bandit14`.

---

### 2. Using the Private SSH Key
I navigated to my home directory and found the private key:

```bash
cd ~
ls
# sshkey.private
```

Then I used the SSH command with the `-i` flag to specify the private key and logged in:

```bash
ssh -i sshkey.private -p 2220 bandit14@localhost
```

Once logged in as `bandit14`, I navigated to the `/etc/bandit_pass` directory to locate the password:

```bash
cd /etc/bandit_pass
ls
# bandit14
cat bandit14
```

From this, I was able to determine the password for the next level.
