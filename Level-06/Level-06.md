# Level 6 → Level 7

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to locate the password stored in a file somewhere on the server.  
The file must meet all of the following properties:  
- Owned by user `bandit7`  
- Owned by group `bandit6`  
- Exactly 33 bytes in size  

---

### 2. Finding the File
I used the `find` command to search the entire filesystem for files matching the required properties:

```bash
find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
```

This returned the file:

```bash
/path/to/the/file
```

---

### 3. Opening the File
I then used the `cat` command to read the file and retrieve the password:

```bash
cat /path/to/the/file
```

This displayed the password for the next level.
