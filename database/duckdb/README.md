# DuckDB

## Environments

Install DuckDB CLI.

```sh
curl https://install.duckdb.org | bash
```

```text
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  5713  100  5713    0     0  13854      0 --:--:-- --:--:-- --:--:-- 13832

*** DuckDB Linux/MacOS installation script, version 1.5.5 ***


         .;odxdl,
       .xXXXXXXXXKc
       0XXXXXXXXXXXd  cooo:
      ,XXXXXXXXXXXXK  OXXXXd
       0XXXXXXXXXXXo  cooo:
       .xXXXXXXXXKc
         .;odxdl,


######################################################################## 100.0%

Successfully installed DuckDB 1.5.5 to /root/.duckdb/cli/1.5.5/duckdb
Updated symlink from /root/.duckdb/cli/latest/duckdb to
                     /root/.duckdb/cli/1.5.5/duckdb

Hint: Append the following line to your shell profile:
export PATH="/root/.duckdb/cli/latest":$PATH
Also created a symlink from /root/.local/bin/duckdb
                         to /root/.duckdb/cli/latest/duckdb

To launch DuckDB 1.5.5 now, type
/root/.duckdb/cli/latest/duckdb
```

Confirm DuckDB CLI version.

```sh
duckdb --version
```

```text
v1.5.5 (Variegata) d8cdaa33fd
```

## Run

Create database.

```sh
duckdb test.db
```

```text
DuckDB v1.5.5 (Variegata)
Enter ".help" for usage hints.
test D
```

Create table.

```sh
CREATE TABLE person (id integer, name text);
.schema
```

```text
CREATE TABLE person(id INTEGER, "name" VARCHAR);
```

Exit database.

```sh
.exit
```

Insert row to table.

```sh
duckdb test.db "INSERT INTO person (id, name) VALUES (1, 'a')"
```

Select row from table.

```sh
duckdb test.db "SELECT id, name FROM person"
```

```text
┌───────┬─────────┐
│  id   │  name   │
│ int32 │ varchar │
├───────┼─────────┤
│     1 │ a       │
└───────┴─────────┘
```

Select output format
`ascii`, `box`(default), `column`, `csv`, `html`, `json`, `jsonlines`,
`line`, `list`, `markdown`, `quote`, `table`.

```sh
duckdb -json test.db "SELECT id, name FROM person"
```

```json
[{"id":1,"name":"a"}]
```

### JSON

Create table with JSON type column.

```sh
duckdb test.db "CREATE TABLE rake (data JSON)"
duckdb test.db .schema
```

```text
CREATE TABLE rake("data" JSON);
```

Insert JSON object to table.

```sh
duckdb test.db "INSERT INTO rake (data) VALUES ({'d1': 1, 'd2': {'d3': 'a'}, 'd4': [2, 3]})"
```

Select JSON object from table.

```sh
duckdb test.db "SELECT data FROM rake"
```

```text
┌─────────────────────────────────────┐
│                data                 │
│                json                 │
├─────────────────────────────────────┤
│ {"d1":1,"d2":{"d3":"a"},"d4":[2,3]} │
└─────────────────────────────────────┘
```

Retrieve JSON property from table.

```sh
duckdb test.db "SELECT data.d2.d3 FROM rake"
```

```text
┌──────┐
│  d3  │
│ json │
├──────┤
│ "a"  │
└──────┘
```

## References

- [DucjDB](https://www.duckdb.org/)
- [duckdb/duckdb](https://github.com/duckdb/duckdb)
