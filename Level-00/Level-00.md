# Bandit Level 0 → Level 1

---

## Steps Taken

### 1. Understanding the Task
The objective of this level is to establish a secure connection to the Bandit server using **SSH** (Secure Shell).  
SSH is a protocol that allows users to securely access and manage remote systems over a network.

---

### 2. Establishing the SSH Connection
To connect to the server, I executed the following command in the terminal.  
This command specifies the username, hostname, and port number provided in the challenge instructions:

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
