# Level 7 → Level 8

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to retrieve the password stored in the `data.txt` file.  
The password is located next to the keyword `millionth`.  
Since the file is very large, it is not practical to open it entirely.

---

### 2. Searching for the Keyword
I used the `grep` command to search for the keyword `millionth` within `data.txt`:

```bash
grep millionth data.txt
```

This displayed the line containing `millionth` along with the password.

---

### 3. Extracting the Password
From the output, I identified the password for the next level located next to the keyword.
