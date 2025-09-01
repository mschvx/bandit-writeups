# Level 20 → Level 21

---

## Steps Taken

### 1. Understanding the Task
The home directory contains a setuid binary `suconnect`. This binary connects to `localhost` on a port you specify and reads a line of text from that connection. It then compares the received line to the previous level’s password (bandit20). If the password matches, it sends back the password for the next level (bandit21).  

We need to simulate a network server locally that sends the previous password so that `suconnect` can read it and return the next password.

---

### 2. Setting Up a Local Server with Netcat
I used `netcat (nc)` to create a simple TCP server that sends the password for bandit20. The command used:

```bash
echo -n '<previous password>' | nc -l -p 1234 &
````

**Explanation of flags and usage:**

* `echo -n` → ensures the password is sent **without a newline character**, which is crucial because `suconnect` compares the line exactly.
* `nc` → netcat, used to create the TCP server.
* `-l` → tells netcat to **listen** for incoming connections (server mode).
* `-p 1234` → specifies the **port number** (1234 is arbitrary, just needs to match what `suconnect` connects to).
* `&` → runs the netcat command in the **background**, so that we can execute `suconnect` while the server is still listening.

---

### 3. Running the Setuid Binary

Once the netcat server was running, I ran the binary and passed the same port:

```bash
./suconnect 1234
```

`suconnect` connected to our netcat listener, read the password we sent, validated it, and returned the password for bandit21.

From this, I was able to determine the password for the next level.

---

### 4. Notes on Technical Details

* Running the listener in the **background** with `&` is necessary; otherwise, the terminal would be blocked and we couldn’t run `suconnect`.
* Using `-n` in `echo` avoids sending extra newline characters that would cause a mismatch.
* Choosing a port number (`1234`) is arbitrary, but it must match on both server (`nc`) and client (`suconnect`).
* The setuid binary allowed `suconnect` to execute with elevated privileges so it could safely transmit the next password.

