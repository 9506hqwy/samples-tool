# Hyperlight Unikraft

## Environments

Install hyperlight-unikraft.

```sh
export HLUK_INSTALL_DIR=~/.local/bin
curl -fsSL https://raw.githubusercontent.com/hyperlight-dev/hyperlight-unikraft/main/install.sh | sh
```

```text
downloading https://github.com/hyperlight-dev/hyperlight-unikraft/releases/download/v0.21.0/hluk-v0.21.0-x86_64-unknown-linux-musl.tar.gz
installed hluk 0.21.0 to /root/.local/bin/hluk
next: hluk init
```

Create project.

```sh
hluk init hello --template bash-repl
```

```text
Created hello from the bash template in hello:
  hluk.toml
  repl.sh
pulled ghcr.io/hyperlight-dev/hyperlight-unikraft/bash:initrd-v0.21.0  1.1 MiB in 1.0 s
Rootfs cached at /root/.cache/hluk/rootfs/ghcr.io/hyperlight-dev/hyperlight-unikraft/bash/initrd-v0.21.0.cpio (1.1 MiB pulled)

Next:
  cd hello
  hluk run
```

Confirm default configuration.

```sh
cat hluk.toml
```

```ini
manifest_version = 1

[app]
name = "hello"

[rootfs]
image = "ghcr.io/hyperlight-dev/hyperlight-unikraft/bash:initrd-v0.21.0"

[run]
script = "repl.sh"
warm = true
```

## Run

Run command on micro-VM.

```sh
hluk run --exec "hostname"
```

```text
unikraft
```

Confirm micro-VM.

```sh
hluk run --exec "ls -R /"
```

```text
/:
bin   dev   etc   lib   proc  sbin  sys   tmp   usr

/bin:
ash        cut        expr       ls         rm         tail       which
awk        date       false      md5sum     rmdir      tee        whoami
base64     dd         find       mkdir      sed        test       xargs
basename   df         grep       mv         seq        touch      yes
busybox    dirname    head       od         sh         tr
cat        du         hexdump    paste      sha256sum  true
chmod      echo       hostname   printf     sleep      uname
chown      egrep      id         readlink   sort       uniq
cp         env        ln         realpath   stat       wc

/dev:
hlcall   hwrng    maps     null     random   stdout   urandom  zero

/etc:
group          hosts          nsswitch.conf  resolv.conf
hostname       mtab           passwd

/lib:
ld-musl-x86_64.so.1

/proc:

/sbin:

/sys:

/tmp:
hl_dispatch.sh

/usr:
bin    local

/usr/bin:

/usr/local:
bin

/usr/local/bin:
hl_bashdriver
```

Run with network access.

```sh
# deny network access
hluk run --exec "echo Hello, World! | nc 192.168.122.161 12321"
```

```text
nc: socket: Permission denied
```

```sh
# allow network access
hluk run --net --exec "echo Hello, World! | nc 192.168.122.161 12321"
```

```text
# no output
```

Run server side before run client.

```sh
# server side
nc -l 12321
```

```text
Hello, World!
```

Run with port bind.

```sh
# deny port bind
hluk run --exec "nc -l 12321"
```

```text
nc: socket: Permission denied
```

```sh
# allow port bind
hluk run --net --port 12321 --exec "nc -l 12321"
```

Run client side after run server.

```{note}
Do not work expectedly ?
```

```sh
echo Hello, World! | nc 127.0.0.1 12321
```

```text
Ncat: Connection refused.
```

Run with filesystem mounted.

```sh
# confirm mounted
hluk run --mount $(pwd):/workspace --exec "ls -l /workspace"
```

```text
total 2
-rw-r--r--    0 root     root          1076 Nov 21 23:49 hluk.toml
-rw-r--r--    0 root     root           628 Nov 21 23:49 repl.sh
```

Create file on host filesystem.

```sh
hluk run --mount $(pwd):/workspace --exec "touch /workspace/test.txt"
```

```sh
# host side
ls -l test.txt
```

```text
-rw-r--r--. 1 root root 0 11月 22 09:41 test.txt
```

Mount read-only filesystem

```sh
hluk run --mount $(pwd):/workspace:ro --exec 'echo "Hello, World!" > /workspace/test.txt'
```

```text
sh: can't open '/workspace/test.txt': Read-only file system
```

## Python

Create project.

```sh
hluk init hello-py --template python
```

```text
Created hello-py from the python template in hello-py:
  .gitignore
  hluk.toml
  main.py
pulled ghcr.io/hyperlight-dev/hyperlight-unikraft/python:initrd-v0.21.0  14.0 MiB in 1.8 s
Rootfs cached at /root/.cache/hluk/rootfs/ghcr.io/hyperlight-dev/hyperlight-unikraft/python/initrd-v0.21.0.cpio (14.0 MiB pulled)

Next:
  cd hello-py
  hluk run
```

Confirm default configuration.

```sh
cat hluk.toml
```

```ini
manifest_version = 1

[app]
name = "hello-py"

[rootfs]
image = "ghcr.io/hyperlight-dev/hyperlight-unikraft/python:initrd-v0.21.0"

[run]
script = "main.py"
warm = true
```

Run *main.py*

```sh
hluk run
```

```text
Hello from hello-py!
Python 3.12 on Unikraft (x86_64), inside a Hyperlight micro-VM
```

## Rust

Install dependencies.

```sh
dnf config-manager --set-enable crb
dnf install glibc-static
```

Create project.

```sh
hluk init hello-rs --template rust
```

```text
Created hello-rs from the rust template in hello-rs:
  .cargo/config.toml
  .gitignore
  Cargo.toml
  hluk.toml
  src/main.rs
pulled ghcr.io/hyperlight-dev/hyperlight-unikraft/rust:initrd-v0.21.0  0.1 MiB in 0.6 s
Rootfs cached at /root/.cache/hluk/rootfs/ghcr.io/hyperlight-dev/hyperlight-unikraft/rust/initrd-v0.21.0.cpio (0.1 MiB pulled)

Next:
  cd hello-rs
  hluk build
  hluk run
```

Confirm default configuration.

```sh
cat hluk.toml
```

```ini
manifest_version = 1

[app]
name = "hello-rs"

[rootfs]
image = "ghcr.io/hyperlight-dev/hyperlight-unikraft/rust:initrd-v0.21.0"

[build]
command = "cargo build --release"

[run]
mounts = ["./target/release:/mnt/app:ro"]
exec = "/mnt/app/app"
warm = true
```

Build application

```sh
hluk build
```

```text
$ cargo build --release
   Compiling hello-rs v0.1.0 (/root/workspace/hello-rs)
    Finished `release` profile [optimized] target(s) in 0.05s
```

Run application

```sh
hluk run
```

```text
Hello from hello-rs!
Rust on linux/x86_64, inside a Hyperlight micro-VM
```
