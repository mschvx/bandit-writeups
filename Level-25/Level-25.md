# Level 25 → Level 26

---

## Steps Taken

### 1. Understanding the Task

The shell for `bandit26` is **not `/bin/bash`**, but a restricted program (`/bin/showtext`) that displays text. To obtain the password, we need to **break out of this restricted shell** into a normal shell and access the password file for `bandit26`.

---

### 2. Investigating the Shell

I checked `/etc/passwd` for `bandit26`:

```bash
cat /etc/passwd | grep bandit26
```

Most users use `/bin/bash`, but `bandit26` uses:

```
/bin/showtext
```

I confirmed `/usr/bin/showtext` exists and saw that it behaves like `more` — it displays text in a paginated way.

---

### 3. Triggering the Pager

Knowing it uses a pager, I made my terminal window **very small** to trigger the `more` interface. Then I logged in:

```bash
ssh bandit26@localhost -p 2220 -i <private_key>
```

The `more` interface appeared as expected.

---

### 4. Breaking Out to Bash

While in the `more` interface, I pressed:

```
v
```

This opened `vim`. Inside `vim`, I ran:

```vim
:set shell=/bin/bash
:shell
```

This gave me a **normal shell prompt** as `bandit26`.

---

### 5. Accessing the Password

From the shell as `bandit26`, I navigated to the password file:

```bash
cd /etc/bandit_pass
cat bandit26
```

The password for `bandit26` was revealed.

From this, I was able to determine the password for the next level.
