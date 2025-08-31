# Level 5 → Level 6

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to locate the password stored in a file somewhere under the `inhere` directory.  
The file must:  
- Be human-readable  
- Have a size of exactly 1033 bytes  
- Not be executable

---

### 2. Finding the File
I navigated into the `inhere` directory and used the `find` command to search for files matching the given properties:

```bash
find . -type f -size 1033c ! -executable
```

The command returned the file:

```bash
./maybehere07/-file2
```

---

### 3. Opening the File
Since the filename begins with a dash (`-`), I used the full path to safely read it:

```bash
cat ./-file2
```

This displayed the password for the next level.
