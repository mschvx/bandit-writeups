# Level 9 → Level 10

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to locate the password stored in `data.txt`.  
The password is contained in one of the few human-readable strings in the file and is preceded by several `=` characters.

---

### 2. Searching for the Password String
I used the `strings` command to extract human-readable sequences from `data.txt`, then filtered the results with `grep` to find strings containing `=`:

```bash
strings data.txt | grep '='
```

This allowed me to identify the line likely containing the password.  
From this, I was able to determine the password for the next level.
