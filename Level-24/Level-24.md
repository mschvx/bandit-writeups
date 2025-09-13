# Level 24 → Level 25

---

## Steps Taken

### 1. Understanding the Task

A daemon is listening on port `30002`. It will return the password for `bandit25` **if** it receives two things on one connection: the password for `bandit24` and the correct 4-digit numeric PIN. There is no way to get the PIN other than trying all `0000`–`9999` combinations (brute force). The service accepts multiple requests over a single connection, so we do **not** need to open a new TCP connection for each PIN — we can stream all attempts into one `nc` session.

---

### 2. Preparing a temporary working directory and script

Commands I ran:

```bash
mktemp -d
cd /tmp/tmp.xxxxxx   # the mktemp output directory
nano test.sh
chmod +x test.sh
```

Inside `test.sh` I put the brute-force pipeline:

```bash
#!/bin/bash

for i in {0000..9999}
do
  echo <bandit24_password> $i
done | nc localhost 30002 | grep -v "Wrong"
```

**Notes on the script:**

* The `for` loop generates every 4-digit code from `0000` to `9999`.
* Each iteration prints a line with `<bandit24_password> <PIN>`.
* The entire loop is piped into a **single** `nc localhost 30002` invocation, so one connection is reused for all 10,000 attempts (much faster and avoids connection overhead).
* `grep -v "Wrong"` filters the service responses: `grep -v` prints all lines **except** those that contain the word `"Wrong"`. This removes the repeated incorrect-response noise so only successful/interesting responses remain visible.

---

### 3. Running the brute-force and extracting the result

Commands I ran:

```bash
./test.sh
```

* The script streamed 10,000 attempts into the listening daemon on port `30002`.
* Most responses contained `"Wrong"` and were filtered out by `grep -v`.
* When the correct 4-digit PIN was tried, the daemon returned the `bandit25` password (the one-line positive response was not filtered by `grep -v`), which I captured from the output.

From this, I was able to determine the password for the next level.


