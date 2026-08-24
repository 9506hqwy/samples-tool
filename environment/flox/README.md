# Flox

## Environments

Install flox.

```sh
sudo rpm --import https://downloads.flox.dev/by-env/stable/rpm/flox-archive-keyring.asc
curl -fsSLO https://downloads.flox.dev/by-env/stable/rpm/flox-1.14.1.x86_64-linux.rpm
sudo rpm -ivh ./flox-1.14.1.x86_64-linux.rpm
```

Confirm flox version.

```sh
flox --version
```

```text
1.14.1
```

## Create

Create flox project.

```sh
flox init
```

```text
Flox collects basic usage metrics in order to improve the user experience.

Flox includes a record of the subcommand invoked along with a unique token.
It does not collect any personal information.

The collection of metrics can be disabled in the following ways:

  environment: FLOX_DISABLE_METRICS=true
    user-wide: flox config --set disable_metrics true
  system-wide: update /etc/flox.toml as described in flox-config(1)

This is a one-time notice.


! You are not logged in to FloxHub. Run 'flox auth login' to log in.
⚡︎ Created environment 'env01' (x86_64-linux)

Next:
  $ flox search <package>    <- Search for a package
  $ flox install <package>   <- Install a package into an environment
  $ flox activate            <- Enter the environment
  $ flox edit                <- Add environment variables and shell hooks
```

Search packages.

```sh
flox search python
```

```text
! You are not logged in to FloxHub. Run 'flox auth login' to log in.
python     High-level dynamically-typed programming language
gpython    Python interpreter written in Go
python2    High-level dynamically-typed programming language
python3    High-level dynamically-typed programming language
python27   High-level dynamically-typed programming language
python36   A high-level dynamically-typed programming language
python37   A high-level dynamically-typed programming language
python38   A high-level dynamically-typed programming language
python39   High-level dynamically-typed programming language
python-qt  PythonQt is a dynamic Python binding for the Qt framework. It offers an easy way to embed the Python scripting language into your C++ Qt applications

Showing 10 of 27974 results. Use `flox search python --all` to see the full list.

Use 'flox show <package>' to see available versions
```

Show packages.

```sh
flox show python3
```

```text
! You are not logged in to FloxHub. Run 'flox auth login' to log in.
python3 - High-level dynamically-typed programming language
Catalog: nixpkgs
Latest:  python3@3.14.7
License: Python-2.0
Outputs: out* (* installed by default)
Systems: aarch64-darwin, x86_64-linux, aarch64-linux

Other versions:
    python3@3.14.7  (aarch64-darwin, aarch64-linux, x86_64-linux only)
    python3@3.14.6  (aarch64-darwin, aarch64-linux, x86_64-linux only)
    python3@3.13.13
    :
    :
```

Install package.

```sh
flox install python3@3.14.7
```

```text
! You are not logged in to FloxHub. Run 'flox auth login' to log in.
✔ 'python3' installed to environment 'env01'
ℹ 'python3' has additional outputs, use 'flox list -a' to see more
```

Confirm flox configuration.

```patch
diff --git a/env01/.flox/env/manifest.toml b/env01/.flox/env/manifest.toml
index 6f3a950..84ff355 100644
--- a/env01/.flox/env/manifest.toml
+++ b/env01/.flox/env/manifest.toml
@@ -15,6 +7,8 @@ schema-version = "1.14.0"
 ##  $ flox show gum     <- show all versions of a package
 ## -------------------------------------------------------------------
 [install]
+python3.pkg-path = "python3"
+python3.version = "3.14.7"
 # gum.pkg-path = "gum"
 # gum.version = "^0.14.5"
```

Confirm installed packages.

```sh
flox list
```

```text
! You are not logged in to FloxHub. Run 'flox auth login' to log in.
python3: python3 (3.14.7)
```

Start flox environment.

```sh
flox activate
```

```text
! You are not logged in to FloxHub. Run 'flox auth login' to log in.
✔ You are now using the environment 'env01'
To stop using this environment, run 'flox deactivate'
```

Exit flox environemnt.

```sh
exit
```

Activate flox automatically using `direnv` (see [use_flox](https://github.com/direnv/direnv/pull/1372).).

```sh
echo 'use flox' >> .envrc
```

## Notes

- Prefer not to send telemetry data, set environment variable
  (see [ENVIRONMENT VARIABLES](https://flox.dev/docs/man/flox#environment-variables)).

  ```sh
  export FLOX_DISABLE_METRICS=true
  ```

## References

- [flox/flox](https://github.com/flox/flox)
