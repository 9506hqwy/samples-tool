# task

## Environments

Install task.

```sh
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin
```

```text
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  9406  100  9406    0     0  21543      0 --:--:-- --:--:-- --:--:-- 21573
go-task/task info checking GitHub for latest tag
go-task/task debug http_download https://github.com/go-task/task/releases/latest
go-task/task info found version: 3.52.0 for v3.52.0/linux/amd64
go-task/task debug downloading files into /tmp/tmp.QEOxEvP080
go-task/task debug http_download https://github.com/go-task/task/releases/download/v3.52.0/task_linux_amd64.tar.gz
go-task/task debug http_download https://github.com/go-task/task/releases/download/v3.52.0/task_checksums.txt
go-task/task info installed /home/vscode/.local/bin/task
```

Confirm task version.

```sh
task --version
```

```text
3.52.0
```

## Run

Run specific task.

```sh
task -t samples/01-basic.yml hello-world
```

```text
task: [hello-world] echo "Hello, World!"
Hello, World!
```

Run specific tasks in order.

```sh
task -t samples/01-basic.yml hello-world-ja hello-world
```

```text
task: [hello-world-ja] echo "Hello, 世界!"
Hello, 世界!
task: [hello-world] echo "Hello, World!"
Hello, World!
```

Run task with parameter.

```sh
task -t samples/04-parameter.yml hello TARGET=World
```

```text
task: [hello] echo "Hello, World!"
Hello, World!
```

## TODO

- status / preconditions
- dynamic variables
- secret
- template
- file pattern rule ?

## References

- [task](https://github.com/go-task/task)
- [TaskThe Modern Task Runner](https://taskfile.dev/)
