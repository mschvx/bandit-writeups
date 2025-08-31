Level 5 → Level 6
-----------------

1. Understanding the Task
The goal is to find the password stored in a file under the "inhere" directory. 
The file must:
- Be human-readable
- Have a size of exactly 1033 bytes
- Not be executable

2. Finding the File
I navigated into the "inhere" directory and ran the following command to search:

find . -type f -size 1033c ! -executable

This returned:

./maybehere07/-file2

3. Opening the File
Since the filename begins with a dash, it cannot be opened directly with "cat file2". 
Instead, I specified the path explicitly:

cat ./-file2

This displayed the password for the next level.
