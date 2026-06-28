# Devbox

## Environments

Install devbox.

```sh
curl -fsSL https://get.jetify.com/devbox | bash
```

```text
evbox 📦 by Jetify
  Instant, easy and predictable development environments.

  This script downloads and installs the latest devbox binary.

Confirm Installation Details
  Location:     /usr/local/bin/devbox
  Download URL: https://releases.jetify.com/devbox

? Install devbox to /usr/local/bin (requires sudo)? [Y/n]

Downloading and Installing
✓ Downloading devbox binary... [DONE]
✓ Installing in /usr/local/bin/devbox... [DONE]
✓ Successfully installed devbox 🚀

Next Steps
  1. Learn how to use devbox
     Run devbox help or read the docs at https://github.com/jetify-com/devbox
  2. Get help and give feedback
     Join our community at https://discord.gg/jetify
```

Confirm devbox version.

```sh
devbox version
```

```text
✓ Downloading version 0.17.5... [DONE]
✓ Verifying checksum... [DONE]
✓ Unpacking binary... [DONE]

0.17.5
```

## Create

Create devbox project.

```sh
devbox init
```

```text
Created devbox.json in /root/workspace/env1
Run `devbox add <package>` to add packages, or `devbox shell` to start a dev shell.
```

Confirm devbox configuration.

```sh
cat devbox.json
```

```json
{
  "$schema": "https://raw.githubusercontent.com/jetify-com/devbox/0.17.5/.schema/devbox.schema.json",
  "packages": [],
  "shell": {
    "init_hook": [
      "echo 'Welcome to devbox!' > /dev/null"
    ],
    "scripts": {
      "test": [
        "echo \"Error: no test specified\" && exit 1"
      ]
    }
  }
}
```

Search packages.

```sh
devbox search python
```

```text
Found 23+ results for "python":

* python  (3.15.0b2, 3.15.0b1, 3.15.0a7, 3.15.0a6, 3.15.0a5, 3.15.0a4, 3.15.0a3, 3.15.0a2, 3.15.0a1, 3.14.4 ...)
* python-caja  (1.28.0)
* python-cosmopolitan  (3.6.14)
* python-launcher  (1.0.1, 1.0.0)
* python-qt  (3.6.1, 3.6.0, 3.5.7, 3.5.6, 3.5.4, 3.5.2, 3.5.1, 3.4.2, 3.3.0, 3.2)
* python-swiftclient  (4.2.0, 4.1.0, 4.0.0, 3.13.1, 3.13.0, 3.12.0)
* python-language-server  (2022-02-18, 2021-09-08, 2021-05-20, 2020-10-08, 2020-06-19, 2020-04-24)
* python-matter-server  (8.1.2, 8.1.1, 8.1.0, 8.0.0, 7.0.1, 6.6.0, 6.3.0, 6.2.2, 6.1.0, 5.10.0 ...)
* python-full  (3.14.0rc1, 3.14.0b4, 3.14.0b3, 3.14.0b2, 3.14.0b1, 3.14.0a7, 3.14.0a6, 3.14.0a5, 3.14.0a4, 3.14.0a2 ...)
* python-minimal  (3.13.13, 3.13.12, 3.13.11, 3.13.9, 3.13.8, 3.13.7, 3.13.5, 3.13.4, 3.12.10, 3.12.9 ...)

Warning: Showing top 10 results and truncated versions. Use --show-all to show all.
```

Install package.

```sh
devbox add python@3.14.4
```

```text
Nix is not installed. Devbox will attempt to install it.

Press enter to continue or ctrl-c to exit.

 INFO nix-installer v2.34.6
 INFO Step: Create directory `/nix`
 INFO Step: Provision Nix
 INFO Step: Create build users (UID 30001-30032) and group (GID 30000)
 INFO Step: Configure Nix
 INFO Step: Install an SELinux Policy for Nix
 INFO Step: Create directory `/etc/tmpfiles.d`
 INFO Step: Configure upstream Nix daemon service
 INFO Step: Remove directory `/nix/temp-install-dir`
 INFO Running self test for shell sh
 INFO Running self test for shell bash
Nix was installed successfully!
To get started using Nix, open a new shell or run `. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh`

Nix installed successfully. Devbox is ready to use!
Ensuring nixpkgs registry is downloaded.
Downloaded 'github:NixOS/nixpkgs/4a29d733e8a7d5b824c3d8c958a946a9867b3eb2' to '/nix/store/p9rjycrjhya7jbi9759vf7xql9cm8xqh-source' (hash 'sha256-f+JACbTqzZ+G92DSnXOUGRhGANb8Blh7CoeYOeBF8/U=').
Ensuring nixpkgs registry is downloaded: Success
Info: Adding package "python@3.14.4" to devbox.json
Info: Installing the following packages to the nix store: python@3.14.4

python NOTES:
Python in Devbox works best when used with a virtual environment (venv, virtualenv, etc.). Devbox will automatically create a virtual environment using `venv` for python3 projects, so you can install packages with pip as normal.
To activate the environment, run `. $VENV_DIR/bin/activate` or add it to the init_hook of your devbox.json
To change where your virtual environment is created, modify the $VENV_DIR environment variable in your init_hook

This plugin creates the following helper files:
* /root/workspace/env1/.devbox/virtenv/python/bin/venvShellHook.sh

This plugin sets the following environment variables:
* VENV_DIR=/root/workspace/env1/.venv

To show this information, run `devbox info python`
```

Confirm devbox configuration.

```patch
diff --git a/devbox.json b/devbox.json
index 0eb460b..b1afbd3 100644
--- a/devbox.json
+++ b/devbox.json
@@ -1,6 +1,6 @@
 {
-  "$schema": "https://raw.githubusercontent.com/jetify-com/devbox/0.17.5/.schema/devbox.schema.json",
-  "packages": [],
+  "$schema":  "https://raw.githubusercontent.com/jetify-com/devbox/0.17.5/.schema/devbox.schema.json",
+  "packages": ["python@3.14.4"],
   "shell": {
     "init_hook": [
       "echo 'Welcome to devbox!' > /dev/null"
```

Confirm installed packages.

```sh
devbox list
```

```text
* python@3.14.4
```

Start devbox environment.

```sh
devbox shell
```

```text
Info: Ensuring packages are installed.
✓ Computed the Devbox environment.
Starting a devbox shell...
Virtual environment directory doesn't exist. Creating new one...
```

Check devbox lock file.

```sh
ls -l devbox.lock
```

```text
-rw-r--r-- 1 root root 2228 Jun 28 12:15 devbox.lock
```

Exit devbox environemnt.

```sh
exit
```

## References

- [Devbox](https://github.com/jetify-com/devbox)
