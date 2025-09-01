# Level 15 → Level 16

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to retrieve the password for the next level by submitting the password of the current level to port 30001 on localhost using SSL/TLS encryption.

---

### 2. Submitting the Current Password
Since the connection requires SSL/TLS, I used the `openssl` command with the `s_client` option to connect securely to the port:

```bash
openssl s_client -connect localhost:30001
```

After the connection was established, a text prompt appeared. I typed the current password at the end of the prompt and pressed Enter.  

From this, I was able to determine the password for the next level.
