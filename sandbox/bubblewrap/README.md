# Bubblewrap

## Environments

Install bubblewrap.

```sh
dnf install bubblewrap
bwrap --version
```

```text
bubblewrap 0.10.0
```

## Run

Run command on all unshared namespaces.

```sh
bwrap \
    --unshare-all \
    --ro-bind /usr/bin /usr/bin \
    --ro-bind /lib64 /lib64 \
    id
```

```text
uid=0 gid=0 groups=0
```

Run command on mounted procfs.

```sh
bwrap \
    --unshare-all \
    --ro-bind /usr/bin /usr/bin \
    --ro-bind /lib64 /lib64 \
    --proc /proc \
    ps
```

```text
    PID TTY          TIME CMD
      1 ?        00:00:00 bwrap
      2 ?        00:00:00 ps
```

Run command on mounted devfs.

```sh
bwrap \
    --unshare-all \
    --ro-bind /usr/bin /usr/bin \
    --ro-bind /lib64 /lib64 \
    --dev /dev \
    ls /dev
```

```text
console  core  fd  full  null  ptmx  pts  random  shm  stderr  stdin  stdout  tty  urandom  zero
```

Run command on mounted tmpfs.

```sh
bwrap \
  --unshare-all \
  --ro-bind /usr/bin /usr/bin \
  --ro-bind /lib64 /lib64 \
  --tmpfs /tmp \
  mktemp
```

```text
/tmp/tmp.pcmggbVSSs
```

Run command on shared network (need to specify `--share-net` after `--unshare-all`).

```sh
bwrap \
    --unshare-all \
    --share-net \
    --ro-bind /usr/sbin /usr/sbin \
    --ro-bind /lib64 /lib64 \
    ip link show
```

```text
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 52:54:00:da:28:19 brd ff:ff:ff:ff:ff:ff
    altname enx525400da2819
```

Run with network access.

```sh
bwrap \
    --unshare-all \
    --share-net \
    --ro-bind /usr/bin /usr/bin \
    --ro-bind /lib64 /lib64 \
    --ro-bind /etc/resolv.conf /etc/resolv.conf \
    curl -k https://www.google.com
```

```text
HTML ...
```

## References

- [Bubblewrap](https://github.com/containers/bubblewrap)
