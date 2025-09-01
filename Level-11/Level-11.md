# Level 11 → Level 12

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to retrieve the password stored in `data.txt`.  
All lowercase (`a-z`) and uppercase (`A-Z`) letters in the file have been **rotated by 13 positions** (ROT13).  
Additionally, the password contains numbers, which are rotated by 5 (ROT5).

---

### 2. Decoding the File
I researched ROT13 and recognized that it splits the alphabet in half, switching letters to the corresponding position in the other half.  
Using the `tr` command, I mapped the original letters to their rotated positions.  
Since the password contains digits, I applied the same logic to `0-9`, rotating them by 5 positions.

```bash
cat data.txt | tr 'A-Za-z0-9' 'N-ZA-Mn-za-m5-90-4'
```

This allowed me to identify the line likely containing the password.  
From this, I was able to determine the password for the next level.
