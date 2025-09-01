# Level 10 → Level 11

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to locate the password stored in `data.txt`.  
The file contains **Base64-encoded data**, so it needs to be decoded to reveal the password.

---

### 2. Decoding the File
I used the `base64` command with the `-d` option to decode the contents of `data.txt`:

```bash
base64 -d data.txt
```

This allowed me to identify the decoded line likely containing the password.  
From this, I was able to determine the password for the next level.
