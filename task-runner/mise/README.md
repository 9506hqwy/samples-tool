# mise

## Environments

Install mise.

```sh
curl https://mise.run | sh
```

```text
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 11241  100 11241    0     0  80620      0 --:--:-- --:--:-- --:--:-- 80870
mise: installing mise...
######################################################################## 100.0%
mise: installed successfully to /home/vscode/.local/bin/mise
mise: run the following to activate mise in your shell:
echo "eval \"\$(/home/vscode/.local/bin/mise activate bash)\"" >> ~/.bashrc

mise: run `mise doctor` to verify this is set up correctly
```

Confirm mise version.

```sh
mise version
```

```text
              _                                        __
   ____ ___  (_)_______        ___  ____        ____  / /___ _________
  / __ `__ \/ / ___/ _ \______/ _ \/ __ \______/ __ \/ / __ `/ ___/ _ \
 / / / / / / (__  )  __/_____/  __/ / / /_____/ /_/ / / /_/ / /__/  __/
/_/ /_/ /_/_/____/\___/      \___/_/ /_/     / .___/_/\__,_/\___/\___/
                                            /_/                 by @jdx
2026.7.0 linux-x64 (2026-07-02)
mise config files in /workspaces/samples-tool/task-runner/mise are not trusted. Trust them? Yes
```

## Run

Run task in directory where *mise.toml* exists.

```sh
# samples/01-basic
mise run hello-world
```

```text
[hello-world] $ echo "Hello, World!"
Hello, World!
```

Run task script in *mise-tasks* directory.

```sh
# samples/01-basic
mise run hello-world-file
```

```text
[hello-world-file] $ /workspaces/samples-tool/task-runner/mise/samples/01-basic/mise-tasks/hello-world-file
Hello, World! in file.
```

Run task in quiet.

```sh
# samples/01-basic
mise run -q hello-world
```

```text
Hello, World!
```

Run multiple task in parallel.

```sh
# samples/01-basic
mise run hello-world ::: hello-world-ja
```

```text
[hello-world] $ echo "Hello, World!"
[hello-world-ja] $ echo "Hello, 世界!"
[hello-world] Hello, World!
[hello-world-ja] Hello, 世界!
[hello-world] Finished in 7.0ms
[hello-world-ja] Finished in 6.1ms
Finished in 8.0ms
```

Run task file in direct.

```sh
mise run ./samples/01-basic/mise-tasks/hello-world-file
```

```text
[] $ /workspaces/samples-tool/task-runner/mise/./samples/01-basic/mise-tasks/hello-world-file
Hello, World! in file.
```

Run task with positional argument.

```sh
# samples/04-parameter
mise run hello 世界
```

```text
[hello] $ echo "Hello, ${usage_target}!"
Hello, 世界!
```

Run task with optional argument.

```sh
# samples/04-parameter
mise run hello-option --target 世界
```

```text
[hello-option] $ echo "Hello, ${usage_target}!"
Hello, 世界!
```

Run same tasks in monorepo.
`//` indicates root, `...` indicates wild card.
Prefix `:` indicates current directory task.

```sh
mise run //...:hello-world
```

```text
[//repo02:hello-world] $ echo "Hello, Repo02!"
[//repo02:hello-world] Hello, Repo02!
[//repo01:hello-world] $ echo "Hello, Repo01!"
[//repo02:hello-world] Finished in 1.8ms
[//repo01:hello-world] Hello, Repo01!
[//repo01:hello-world] Finished in 1.9ms
Finished in 6.0ms
```

## TODO

- template
- sandbox
- error handing ?
- sub project ?
- file pattern rule ?

## Notes

- Prefer not to send telemetry data, set `use_versions_host=false`
  (see [use_versions_host](https://mise.jdx.dev/configuration/settings.html#use_versions_host)).

## References

- [mise](https://github.com/jdx/mise)
- [Tasks](https://mise.en.dev/tasks/)
