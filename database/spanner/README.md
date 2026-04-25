# Spanner Omni

## Start

Start database.

```sh
podman run \
    -d \
    -p 15000-15025:15000-15025 \
    -p 15026:15026 \
    us-docker.pkg.dev/spanner-omni/images/spanner-omni:2026.r1-beta \
        start-single-server
```

Create database (`retail` sample database).

```sh
podman exec -it <container> \
    /google/spanner/bin/spanner databases create-sample-db retail \
        --database-name=retail-sample
```

```text
Created database: retail-sample and applied schema.
Inserted User Data.
Inserted Product Data.
Inserted Address Data.
Inserted Shopping Cart Data.
Inserted Payment Data.
Inserted Order Data.
Inserted Order Item Data.
Created sample database successfully.
```

Confirm database.

```sh
podman exec -it <container> /google/spanner/bin/spanner databases list
```

```text
NAME           STATE  VERSION_RETENTION_PERIOD  EARLIEST_VERSION_TIME        ENABLE_DROP_PROTECTION
retail-sample  READY  1h                        2026-04-24T13:26:06.718561Z  false
spanner-info   READY  1h                        2026-04-24T12:27:02.035941Z  false
```

Start console and browse http://localhost:15026.

```sh
podman exec -it <container> /app/bin/spanner-console
```

Connect database using SQL shell.

```sh
podman exec -it <container> /google/spanner/bin/spanner sql --database=retail-sample
```

```text
Welcome to Spanner-Cli Client.

Type 'help' or '\h' for help.
Type 'exit' or 'quit' or '\q' to exit.

spanner-cli>
```

## References

- [Spanner Omni](https://cloud.google.com/products/spanner/omni)
- [Spanner Omni Documentation](https://docs.cloud.google.com/spanner-omni)
