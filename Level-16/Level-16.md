# Level 16 → Level 17

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to retrieve the credentials for the next level by submitting the password of the current level to a port on localhost in the range 31000 to 32000. Only one server in this range will give the correct credentials using SSL/TLS, while the others simply echo back what is sent.

---

### 2. Scanning for Open Ports
I scanned the port range to identify which ports had a server listening:

```bash
nmap -p 31000-32000 localhost
```

This returned five open ports. To identify which of these used SSL/TLS, I tested each with OpenSSL.

---

### 3. Identifying the SSL/TLS Port
Since the password starts with the letter `k`, which is interpreted as a command in `s_client`, I used the `-quiet` flag to prevent conflicts. The port 31790 responded with an RSA private key:

```bash
openssl s_client -connect localhost:31790 -quiet
```

---

### 4. Storing the Private Key
As Bandit often restricts editing in the home directory, I created a temporary directory and saved the RSA key there:

```bash
mktemp -d
cd <temporary_directory>
nano my.key   # pasted the RSA key
chmod 600 my.key
```

---

### 5. Logging in to the Next Level
Finally, I used the private key to SSH into Bandit 17. The default Bandit SSH port 2220 was specified:

```bash
ssh -i my.key bandit17@localhost -p 2220
```

Once logged in, I navigated to `/etc/bandit_pass/bandit17` to retrieve the password for the next level.  

From this, I was able to determine the password for the next level.
