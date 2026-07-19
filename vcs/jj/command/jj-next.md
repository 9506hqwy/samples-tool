# next コマンド

子リビジョンに移動する。

リポジトリの履歴を確認する。

```sh
jj log
```

```text
○  wurntztk root@home.local 2026-07-19 10:23:24 62d0ea49
│  (no description set)
@  kwvzrxsn root@home.local 2026-07-19 10:22:05 4e057b56
│  (no description set)
◆  zzzzzzzz root() 00000000
```

子リビジョンに移動する。
作業コピーが子要素を持っている場合は `--edit` オプションを使用する。

```sh
jj next --edit
```

```text
Working copy  (@) now at: wurntztk 62d0ea49 (no description set)
Parent commit (@-)      : kwvzrxsn 4e057b56 (no description set)
Added 0 files, modified 1 files, removed 0 files
```

リポジトリの履歴を確認する。
子リビジョンに移行している。

```sh
jj log
```

```text
@  wurntztk root@home.local 2026-07-19 10:23:24 62d0ea49
│  (no description set)
○  kwvzrxsn root@home.local 2026-07-19 10:22:05 4e057b56
│  (no description set)
◆  zzzzzzzz root() 00000000
```

リポジトリの履歴を確認する。

```sh
jj log
```

```text
@  llylzrxt root@home.local 2026-07-19 11:28:02 c22f8126
│  (empty) (no description set)
│ ○  wurntztk root@home.local 2026-07-19 10:23:24 62d0ea49
├─╯  (no description set)
○  kwvzrxsn root@home.local 2026-07-19 10:22:05 4e057b56
│  (no description set)
◆  zzzzzzzz root() 00000000
```

子リビジョンに移動する。

```sh
jj next
```

```text
Working copy  (@) now at: rznyovqo 5becd16c (empty) (no description set)
Parent commit (@-)      : wurntztk 62d0ea49 (no description set)
Added 0 files, modified 1 files, removed 0 files
```

リポジトリの履歴を確認する。

```sh
jj log
```

```text
@  rznyovqo root@home.local 2026-07-19 11:29:40 5becd16c
│  (empty) (no description set)
○  wurntztk root@home.local 2026-07-19 10:23:24 62d0ea49
│  (no description set)
○  kwvzrxsn root@home.local 2026-07-19 10:22:05 4e057b56
│  (no description set)
◆  zzzzzzzz root() 00000000
```
