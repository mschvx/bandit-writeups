# Level 12 → Level 13

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to retrieve the password from `data.txt`, which is a hexdump of a file that has been repeatedly compressed. To safely manipulate the file, it is suggested to create a temporary working directory under `/tmp`.

### 2. Preparing a Working Directory
I created a temporary directory using `mktemp -d` and copied `data.txt` there:

```
mktemp -d
cp ~/data.txt /tmp/<temp-directory>
cd /tmp/<temp-directory>
```

This allows full manipulation of the file without restrictions from the home directory.

### 3. Reversing the Hexdump
To convert the hexdump back to binary, I used `xxd -r`:

```
xxd -r data.txt > data.bin
file data.bin
```

I then verified the file type using the `file` command.

### 4. Iteratively Decompressing the File
The file was repeatedly compressed using gzip, bzip2, and tar, so I checked the type of the file after each decompression step and used the appropriate commands.

**Gzip:**

```
mv data.bin data.gz
gzip -d data.gz
file data
```

**Bzip2:**

```
mv data data.bz2
bunzip2 data.bz2
file data
```

**Tar Archives:**

```
tar -xf data
file <extracted-file>
tar -xf <next-tar-file>
```

I repeated this process until the `file` command reported `ASCII text`.
From this, I was able to determine the password for the next level.


