# edit コマンド

「変更」する対象のリビジョンを更新する。

リポジトリの履歴を確認する。

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

リポジトリの状態を確認する。

```sh
jj st
```

```text
Working copy changes:
M README.md
Working copy  (@) : wurntztk 62d0ea49 (no description set)
Parent commit (@-): kwvzrxsn 4e057b56 (no description set)
```

編集対象を親リビジョンに設定する。

```sh
jj edit @-
```

```text
Working copy  (@) now at: kwvzrxsn 4e057b56 (no description set)
Parent commit (@-)      : zzzzzzzz 00000000 (empty) (no description set)
Added 0 files, modified 1 files, removed 0 files
```

リポジトリの履歴を確認する。
現在の位置が親リビジョンを示す。

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

リポジトリの状態を確認する。
親リビジョンの「変更」が確認できる。

```sh
jj st
```

```text
Working copy changes:
A README.md
Working copy  (@) : kwvzrxsn 4e057b56 (no description set)
Parent commit (@-): zzzzzzzz 00000000 (empty) (no description set)
```
