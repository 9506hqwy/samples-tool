# Nix Flake

## Environments

Install nix.

```sh
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh -s -- --no-daemon
```

```text
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  4499  100  4499    0     0   4738      0 --:--:-- --:--:-- --:--:--  4738
downloading Nix 2.35.2 binary tarball for x86_64-linux from 'https://releases.nixos.org/nix/nix-2.35.2/nix-2.35.2-x86_64-linux.tar.xz' to '/tmp/nix-binary-tarball-unpack.EKbXt09RBM'...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 25.8M  100 25.8M    0     0  10.6M      0  0:00:02  0:00:02 --:--:-- 10.6M
Note: a multi-user installation is possible. See https://nix.dev/manual/nix/stable/installation/installing-binary.html#multi-user-installation
performing a single-user installation of Nix...
directory /nix does not exist; creating it by running 'mkdir -m 0755 /nix && chown centos10 /nix' using sudo
copying Nix to /nix/store...

installing 'nix-2.35.2'
building '/nix/store/3v9waf1zcy52sd2xf30ndbwssp7d4sza-user-environment.drv'...
unpacking 1 channels...
modifying /home/centos10/.bash_profile...

Installation finished!  To ensure that the necessary environment
variables are set, either log in again, or type

  . /home/centos10/.nix-profile/etc/profile.d/nix.sh

in your shell.
```

Confirm nix version.

```sh
nix --version
```

```text
nix (Nix) 2.35.2
```

Enable flake features.

```sh
mkdir -p ~/.config/nix/
echo "extra-experimental-features = flakes" >> ~/.config/nix/nix.conf
cat ~/.config/nix/nix.conf
```

```text
extra-experimental-features = flakes
```

Install nixfmt.

```sh
nix profile install nixpkgs#nixfmt
whereis nixfmt
```

```text
nixfmt: /nix/store/a8yllzi8dvxplqh8l8arvr20hmlapfay-profile/bin/nixfmt
```

## Create

Create nix flake project.

```sh
nix flake init
```

```text
wrote: "/home/centos10/projects/samples-tool/environment/nix/env01/flake.nix"
```

Activate nix automatically using `direnv` (see [use_flake](https://github.com/direnv/direnv/pull/847)).

```sh
echo 'use flake' >> .envrc
```

## References

- [NixOS](https://nixos.org/)
- [Nix/Nixpkgs/NixOS](https://github.com/NixOS)
- [Nix community projects](https://github.com/nix-community)
- [Nix 2.35.2 Reference Manual](https://nix.dev/manual/nix/2.35/introduction.html)
