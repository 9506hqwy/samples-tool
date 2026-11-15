# Semgrep

## Environments

Install semgrep.

```sh
uv tool install semgrep
```

```text
Installed 2 executables: pysemgrep, semgrep
```

Confirm semgrep version.

```sh
semgrep --version
```

```text
1.185.0
```

## Run

### Literal

Check string literal.

```sh
cd samples/literal
semgrep scan --config rules.yaml --quiet --oss-only
```

```text
    main.py
   ❯❯❱ word-hello
          ❰❰ Blocking ❱❱
          Found 'Hello' literal

            7┆ print('Hello, World!')
            ⋮┆----------------------------------------
           13┆ print("Hello, World!")
```

### Comments

Check string in comment or docstring.

```sh
cd samples/comment
semgrep scan --config rules.yaml --quiet --oss-only
```

```text
    main.py
   ❯❯❱ comment-hello
          ❰❰ Blocking ❱❱
          Found 'Hello' comment

            5┆ def Hello():
            6┆     # Output Hello, World!
            7┆     print('Hello, World!')
            ⋮┆----------------------------------------
            6┆ # Output Hello, World!
            ⋮┆----------------------------------------
           10┆ def main():
           11┆     """Output Hello, World!
           12┆     """
           13┆     print("Hello, World!")
            ⋮┆----------------------------------------
           17┆ # Output Hello, World!
```

### In Range

Check string in main function.

```sh
cd samples/range
semgrep scan --config rules.yaml --quiet --oss-only
```

```text
    main.py
   ❯❯❱ hello-in-main
          ❰❰ Blocking ❱❱
          Found 'Hello' function

           14┆ Hello()
```

### Evaluation

Evaluation string using python code.

```sh
cd samples/eval
semgrep scan --config rules.yaml --quiet --oss-only
```

```text
    main.py
   ❯❯❱ hello-function-call
          ❰❰ Blocking ❱❱
          Found 'Hello' function call

           10┆ Hello("World")
```

### Meta Variables

Using multi variables.

```sh
cd samples/metavar
semgrep scan --config rules.yaml --quiet --oss-only
```

```text
    main.py
   ❯❯❱ arg-in-docstring
          ❰❰ Blocking ❱❱
          Missing argument(arg2) in docstring

           15┆ def Unknown(arg1: str, arg2: str):
           16┆     """Output Hello, World!
           17┆
           18┆     Args:
           19┆         arg1 (str): The first argument.
           20┆     """
           21┆     print(f'Hello, {arg1} and {arg2}!')
```

### Generic Text

Using regex.

```sh
cd samples/generics
semgrep scan --config rules.yaml --quiet --oss-only
```

```text
    b.py
   ❯❯❱ module-comment
          ❰❰ Blocking ❱❱
          Missing module-level comment
```

## Notes

- Prefer not to send telemetry data, set environment variable
  (see [Semgrep metrics](https://docs.semgrep.dev/metrics)).

  ```sh
  export SEMGREP_SEND_METRICS=off
  ```

## References

- [Semgrep](https://docs.semgrep.dev/)
- [Semgrep Community Edition](https://docs.semgrep.dev/getting-started/quickstart-ce)
