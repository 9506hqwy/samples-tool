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

## Create

Search packages.

```sh
mise search python
```

```text
Tool    Description
python  python language. https://mise.en.dev/lang/python.html
```

Search package's version.

```sh
mise ls-remote python 3.14
```

```text
3.14.0
3.14-dev
3.14.1
3.14.2
3.14.3
3.14.4
3.14.5
3.14.6
```

Install package.

```sh
mise use python@3.14.6
```

```text
mise hint use multiple versions simultaneously with mise use python@3.12 python@3.11
mise hint installing precompiled python from astral-sh/python-build-standalone
if you experience issues with this python (e.g.: running poetry), switch to python-build by running mise settings python.compile=1
python@3.14.6   Python 3.14.6                                                                                                      ✔
mise /workspaces/samples-tool/environment/mise/env01/mise.toml tools: python@3.14.6
```

Confirm mise configuration.

```patch
diff --git a/mise.toml b/mise.toml
index e69de29..de3d796 100644
--- a/mise.toml
+++ b/mise.toml
@@ -0,0 +1,2 @@
+[tools]
+python = "3.14.6"
```

Confirm installed packages.

```sh
mise ls
```

```text
Tool    Version  Source                                                     Requested
python  3.14.6   /workspaces/samples-tool/environment/mise/env01/mise.toml  3.14.6
```

Start mise environment.

```sh
eval "$(mise activate bash)"
```

Exit mise environemnt.

```sh
mise deactivate
```

## Notes

- Prefer not to send telemetry data, set `use_versions_host=false`
  (see [use_versions_host](https://mise.jdx.dev/configuration/settings.html#use_versions_host)).

## References

- [mise](https://github.com/jdx/mise)
- [Dev Tools](https://mise.en.dev/dev-tools/)
