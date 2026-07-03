# direnv

## Environments

Install direnv.

```sh
curl -sfL https://direnv.net/install.sh | bash
```

```text
[installer] kernel=linux machine=amd64
[installer] bin_path is not set, you can set bin_path to specify the installation path
[installer] e.g. export bin_path=/path/to/installation before installing
[installer] looking for a writeable path from PATH environment variable
bin_path=/home/centos10/.local/bin
release=latest
[installer] looking for a download URL
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 49319    0 49319    0     0   126k      0 --:--:-- --:--:-- --:--:--  126k
download_url=https://github.com/direnv/direnv/releases/download/v2.37.1/direnv.linux-amd64
[installer] downloading
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 7960k  100 7960k    0     0  8119k      0 --:--:-- --:--:-- --:--:-- 22.2M

The direnv binary is now available in:

    /home/centos10/.local/bin/direnv

The last step is to configure your shell to use it. For example for bash, add
the following lines at the end of your ~/.bashrc:

    eval "$(direnv hook bash)"

Then restart the shell.

For other shells, see https://direnv.net/docs/hook.html

Thanks!
```

Confirm direnv version.

```sh
direnv version
```

```text
2.37.1
```

Setup direnv.

```sh
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
```

## Create

Create direnv project.

```sh
direnv edit .
```

```text
direnv: loading ~/projects/samples-tool/environment/direnv/env01/.envrc
direnv: export +PROJECT
```

Move another directory.

```sh
cd ..
```

```text
direnv: unloading
```

Move direnv project directory.

```sh
cd ~/projects/samples-tool/environment/direnv/env01/
```

```text
direnv: loading ~/projects/samples-tool/environment/direnv/env01/.envrc
direnv: export +PROJECT
```

 Need to allow direnv project if modify *.envrc* file in directly.

```sh
direnv allow .
```

```text
direnv: loading ~/projects/samples-tool/environment/direnv/env01/.envrc
direnv: export +PROJECT
```

## References

- [direnv](https://github.com/direnv/direnv)
