# Process Compose

Install process-compose.

```sh
VERSION=1.122.0
curl -fsSL -o - "https://github.com/F1bonacc1/process-compose/releases/download/v${VERSION}/process-compose_linux_amd64.tar.gz" | \
    tar -zxf - -O "process-compose" > ~/.local/bin/process-compose
chmod +x ~/.local/bin/process-compose
```

Create config directory.

```sh
mkdir -p ~/.config/process-compose
```

Confirm process-compose version.

```sh
process-compose
```

```text
Process Compose
Version:        v1.122.0
Commit:         23b0aca
Date (UTC):     2026-08-17T22:59:01Z
License:        Apache-2.0
Discord:        https://discord.gg/S4xgmRSHdC
Author:         Eugene Berger
```

## Run

Start process.

```sh
process-compose up --detach-on-success --detached-with-tui -f samples/01-basic.yml
```

```text
Starting Process Compose in detached mode. Use 'process-compose attach' to connect to it or 'process-compose down' to stop it
All processes started successfully, detached from TUI
PID     NAME    NAMESPACE   STATUS    AGE   HEALTH   RESTARTS   EXITCODE
23783   sleep   default     Running   0s    -        0          0
```

Confirm process.

```sh
process-compose list -o wide
```

```text
PID     NAME    NAMESPACE   STATUS    AGE     HEALTH   RESTARTS   EXITCODE
23783   sleep   default     Running   4m44s   -        0          0
```

Stop process.

```sh
process-compose down
```

Start process without TUI.

```sh
process-compose up -f samples/03-directory.yml -t=false
```

```text
[pwd-1  ] /home/centos10/projects/samples-tool/environment/process-compose
[pwd-2  ] /
```

## References

- [Process Compose](https://f1bonacc1.github.io/process-compose/)
