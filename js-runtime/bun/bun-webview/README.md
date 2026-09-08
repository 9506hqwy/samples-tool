# Bun WebView

## Environments

Install bun runtime.

```sh
curl -fsSL https://bun.com/install | bash
```

```text
######################################################################## 100.0%
bun was installed successfully to ~/.bun/bin/bun

Added "~/.bun/bin" to $PATH in "~/.bash_profile"

To get started, run:

  source /home/centos10/.bash_profile
  bun --help
```

Confirm bun version.

```sh
bun --version
```

```text
1.4.2
```

Download Chrome.

```sh
curl -fsSLO https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
```

Install Chrome.

```sh
sudo dnf install google-chrome-stable_current_x86_64.rpm
```

## Run

Run scripts.

```sh
bun 01-initialize.ts
```
