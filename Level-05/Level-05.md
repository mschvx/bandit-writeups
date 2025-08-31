# Level 5 → Level 6

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to locate the password file hidden somewhere under the `inhere` directory.  
The file has the following properties:  
- Human-readable  
- Exactly 1033 bytes in size  
- Not executable  

---

### 2. Finding the File
I navigated into the `inhere` directory and used the `find` command with specific options to search for files matching the given properties.  
In particular, I looked for files with a size of 1033 bytes and excluded executables:

```bash
find . -type f -size 1033c ! -executable
