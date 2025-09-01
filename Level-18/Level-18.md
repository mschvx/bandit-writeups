# Level 18 → Level 19

---

## Steps Taken

### 1. Understanding the Task
The password for the next level is stored in a file `readme` in the home directory. However, `.bashrc` has been modified to log you out immediately upon login via SSH.

---

### 2. Accessing the File Despite Immediate Logout
Since SSH allows executing a command remotely without fully logging in, I ran:

```bash
ssh bandit18@bandit.labs -p 2220 'cat readme'
````
From this, I was able to determine the password for the next level.

