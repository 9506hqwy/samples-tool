# Deno Desktop

## Environments

Install deno runtime.

```sh
curl -fsSL https://deno.land/install.sh | sh
```

```text
######################################################################## 100.0%
Archive:  /root/.deno/bin/deno.zip
  inflating: /root/.deno/bin/deno
Deno was installed successfully to /root/.deno/bin/deno
info: backing '/root/.profile' up to '/root/.deno/.shellRcBackups/.profile.bak'
info: backing '/root/.bashrc' up to '/root/.deno/.shellRcBackups/.bashrc.bak'
info: backing '/root/.zshrc' up to '/root/.deno/.shellRcBackups/.zshrc.bak'

Deno was added to the PATH.
You may need to restart your shell for it to become available.

Run '/root/.deno/bin/deno --help' to get started

Stuck? Join our Discord https://discord.gg/deno
```

Confirm deno version.

```sh
deno --version
```

```text
deno 2.9.6 (stable, release, x86_64-unknown-linux-gnu)
v8 15.0.245.2-rusty
typescript 6.0.3
```

## Run

Build desktop app.

```sh
deno desktop main.ts
```

```text
⚠ deno desktop is experimental and subject to change
Compile main.ts to ./dist/linux/main.so

Embedded Files

main.so
└── main.ts (377B)

Files: 1.98KB
Metadata: 1.51KB
Remote modules: 12B

Bundle ./dist/linux/main
```

Build desktop app for Windows.

```sh
deno desktop --target x86_64-pc-windows-msvc main.ts
```

```text
⚠ deno desktop is experimental and subject to change
Compile main.ts to ./dist/linux/main.dll

Embedded Files

main.dll
└── main.ts (377B)

Files: 1.98KB
Metadata: 1.51KB
Remote modules: 12B

Bundle ./dist/linux/main
```

Develop using vscode remote SSH.

```sh
deno run --hmr main.ts
```

```text
HMR Process started.
✅ Granted net access to "0.0.0.0:8000".
Listening on http://0.0.0.0:8000/ (http://localhost:8000/)
```
