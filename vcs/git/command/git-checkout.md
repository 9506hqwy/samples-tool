# checkout コマンド

[restore](./git-restore.md) コマンドと [switch](./git-switch.md) コマンドの機能を持つ。

## ソースコード

- [builtin/checkout.c](https://github.com/git/git/blob/v2.47.1/builtin/checkout.c)

## ブランチを切替

[switch](./git-switch.md) コマンドと同じ。

既存のブランチに切り替える。

```sh
> git checkout A
Switched to branch 'A'
```

新規にブランチを作成する。

```sh
> git checkout -b C
Switched to a new branch 'C'
```

## ワーキングツリーの状態をリストア

[restore](./git-restore.md) コマンドと同じ。

ワーキングツリーをインデックスの状態に戻す。

```sh
> git checkout README.md
Updated 1 path from the index
```

ワーキングツリーをコミットの状態に戻す。

```sh
> git checkout HEAD README.md
Updated 1 path from f93e3a1
```
