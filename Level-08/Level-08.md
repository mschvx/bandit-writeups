# Level 8 → Level 9

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to retrieve the password stored in `data.txt`.  
The password is the only line in the file that occurs **exactly once**.  
Since the file is large, it is not practical to scan it manually.

---

### 2. Sorting and Finding Unique Lines
I first sorted the file so that identical lines would be adjacent, then used `uniq -u` to extract lines that occur only once:

```bash
sort data.txt | uniq -u
```

This displayed the unique line, which is the password for the next level.

---

### 3. Extracting the Password
From the output, I identified the password for the next level.
