# Level 14 → Level 15

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to retrieve the password for the next level by submitting the current level's password to a service listening on port `30000` on `localhost`.

---

### 2. Sending the Password
After identifying the current password, I used the `echo` command to print it and piped it into `nc` (netcat) to send it to the service:

```bash
echo "CURRENT_PASSWORD" | nc localhost 30000
```

- `echo "CURRENT_PASSWORD"` outputs the current level password.  
- The pipe `|` sends this output to `nc`.  
- `nc localhost 30000` connects to the local port `30000` and sends the password.  

From this, I was able to determine the password for the next level.
