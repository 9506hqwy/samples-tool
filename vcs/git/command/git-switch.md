# switch コマンド

ブランチを切り替える。

```sh
git switch <ブランチ>
```

## ソースコード

- [builtin/checkout.c](https://github.com/git/git/blob/v2.47.1/builtin/checkout.c)

## *.git* ディレクトリ

ブランチを切り替えたときの *.git* ディレクトリを確認する。

develop ブランチを作成する。

```sh
> git switch -c develop
Switched to a new branch 'develop'
```

ファイル構造を確認する。
[git commit](./git-commit.md) の状態と比較すると *refs/heads/develop* が作成される。

```sh
> LANG=C tree -aF
.
|-- .git/
|   |-- COMMIT_EDITMSG
|   |-- HEAD
|   |-- branches/
|   |-- config
|   |-- description
|   |-- hooks/
|   |   |-- applypatch-msg.sample*
|   |   |-- commit-msg.sample*
|   |   |-- fsmonitor-watchman.sample*
|   |   |-- post-update.sample*
|   |   |-- pre-applypatch.sample*
|   |   |-- pre-commit.sample*
|   |   |-- pre-merge-commit.sample*
|   |   |-- pre-push.sample*
|   |   |-- pre-rebase.sample*
|   |   |-- pre-receive.sample*
|   |   |-- prepare-commit-msg.sample*
|   |   |-- push-to-checkout.sample*
|   |   |-- sendemail-validate.sample*
|   |   `-- update.sample*
|   |-- index
|   |-- info/
|   |   `-- exclude
|   |-- logs/
|   |   |-- HEAD
|   |   `-- refs/
|   |       `-- heads/
|   |           |-- develop
|   |           `-- main
|   |-- objects/
|   |   |-- 17/
|   |   |   `-- 5d63f192341c2c4d5085b3c7a39c7826e3e33a
|   |   |-- 91/
|   |   |   `-- 1f4d167e7ee2199730a57ce4cd12fa34b7f9fa
|   |   |-- b7/
|   |   |   `-- a72de2bb54febf3f485d4eaed204f42c2c3feb
|   |   |-- info/
|   |   `-- pack/
|   `-- refs/
|       |-- heads/
|       |   |-- develop
|       |   `-- main
|       `-- tags/
`-- README.md

16 directories, 29 files
```

`HEAD` は develop ブランチを参照している。

```sh
> cat .git/HEAD
ref: refs/heads/develop
```

*refs/heads/develop* は develop ブランチが示すオブジェクトの SHA1 が保存されている。

```sh
> cat .git/refs/heads/develop
b7a72de2bb54febf3f485d4eaed204f42c2c3feb
```

## ブランチの切替

`switch` コマンドを使用せずにブランチを切り替える。

develop ブランチの参照先コミットを設定する。

```sh
> git update-ref refs/heads/develop 18035f26a29419a712a88d3cb148a84d2ccf7884
```

`HEAD` を develop ブランチに向ける。

```sh
> git symbolic-ref HEAD refs/heads/develop
```

develop ブランチを確認する。

```sh
> git log
commit 18035f26a29419a712a88d3cb148a84d2ccf7884 (HEAD -> develop, main)
Author: root <root@home.local>
Date:   Sat Mar 22 14:43:11 2025 +0900

    Initial commit
```
