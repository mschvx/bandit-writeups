# Level 17 → Level 18

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to find the password for Bandit 18. In the home directory, there are two files: `passwords.old` and `passwords.new`. The password for the next level is the only line that differs between the two files, specifically in `passwords.new`.

---

### 2. Comparing the Files
I used the `diff` command to identify which line had changed:

```bash
diff passwords.old passwords.new
````

This highlighted the line in `passwords.new` that is different from `passwords.old`.
From this, I was able to determine the password for the next level.



