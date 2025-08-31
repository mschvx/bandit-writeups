# Level 1 → Level 2

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to retrieve the password stored in a file named `-` located in the home directory.

---

### 2. Locating and Reading the File
After logging in, I used the `ls` command to list the files in the home directory.  
Once I confirmed the presence of the `-` file, I used the `cat` command to read its contents. Because `-` is interpreted as an option by many commands, I specified the relative path (`./-`) to safely access the file and reveal the password.
