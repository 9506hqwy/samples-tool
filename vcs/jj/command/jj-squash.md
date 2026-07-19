# squash コマンド

あるのリビジョンの「変更」を別のリビジョンに移動する。

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

現在のコミットの「変更」を親コミットに移動する。

```sh
jj squash
```

```text
Working copy  (@) now at: xzswxuvz dbedd4df (empty) (no description set)
Parent commit (@-)      : kwvzrxsn 02d616ae (no description set)
```

リポジトリの状態を確認する。
「変更」が親リビジョンに移動し「commit ID」が変更される。
そして新規のリビジョンが作成される。

```sh
jj st
```

```text
The working copy has no changes.
Working copy  (@) : xzswxuvz dbedd4df (empty) (no description set)
Parent commit (@-): kwvzrxsn 02d616ae (no description set)
```

インタラクティブに移動する「変更」を選択する場合は `-i` オプションを使用する。
一部の「変更」が親リビジョンに移動し「commit ID」が変更される。
そして「変更」が残っているので「change ID」は変更なく「commit ID」が更新される。

```sh
jj squash -i
```

```text
Hint: Using default editor ':builtin'; run `jj config set --user ui.diff-editor :builtin` to disable this message.
Rebased 1 descendant commits
Working copy  (@) now at: wurntztk b5f4c9be (no description set)
Parent commit (@-)      : kwvzrxsn 9c0b2135 (no description set)
```

特定のファイルのみ移動する場合はファイルパスを指定する。
「変更」が親リビジョンに移動し「commit ID」が変更される。
そしてリビジョンが空になったので新規のリビジョンが作成される。

```sh
jj squash README.md
```

```text
Working copy  (@) now at: olkpzznu 9de45a98 (empty) (no description set)
Parent commit (@-)      : kwvzrxsn 7fa76d03 (no description set)
```
