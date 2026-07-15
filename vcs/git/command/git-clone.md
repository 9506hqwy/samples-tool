# clone コマンド

リポジトリをクローンする。

```sh
git clone <リポジトリ>
```

## ソースコード

- [builtin/clone.c](https://github.com/git/git/blob/v2.47.1/builtin/clone.c)

## リポジトリのすべてをクローン

すべてのコミット、ブランチ、タグをクローンし HEAD をチェックアウトする。

[git log](./git-log.md) のリポジトリ(*work3*)をクローンする。

```sh
> git clone work3 work4
Cloning into 'work4'...
done.
```

ログを確認する。

```sh
> git log --oneline
3d6320e (HEAD -> main, origin/main, origin/HEAD) 7
a2e57f8 6
cb609e6 (origin/B) 5
1f00ec0 (origin/A) 4
ddb8418 3
3c7eeeb 2
538b83e 1
```

### *.git* ディレクトリ

リポジトリをクローンしたときの *.git* ディレクトリを確認する。

```sh
> LANG=C tree -aF
.
|-- .git/
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
|   |       |-- heads/
|   |       |   `-- main
|   |       `-- remotes/
|   |           `-- origin/
|   |               `-- HEAD
|   |-- objects/
|   |   |-- 1f/
|   |   |   `-- 00ec0b881277dd1a3b28988921a2a6f9a51422
|   |   |-- 3c/
|   |   |   `-- 7eeeb9400b19cf76ea232e6cd47c7223e49d00
|   |   |-- 3d/
|   |   |   `-- 6320ec2e38e3e98e157b6a443f63e5766a1dbe
|   |   |-- 53/
|   |   |   `-- 8b83e7010d646dd160391435b3bc77f6495275
|   |   |-- a2/
|   |   |   `-- e57f8afbd4cebb4e444fde7956d7f9c033199e
|   |   |-- cb/
|   |   |   `-- 609e67f31a407a48c4826d869a0f203d6986c1
|   |   |-- dd/
|   |   |   `-- b8418654758fee92deacdc322b66fc36dc153d
|   |   |-- e6/
|   |   |   `-- 9de29bb2d1d6434b8b29ae775ad8c2e48c5391
|   |   |-- f9/
|   |   |   `-- 3e3a1a1525fb5b91020da86e44810c87a2d7bc
|   |   |-- info/
|   |   `-- pack/
|   |-- packed-refs
|   `-- refs/
|       |-- heads/
|       |   `-- main
|       |-- remotes/
|       |   `-- origin/
|       |       `-- HEAD
|       `-- tags/
`-- README.md

26 directories, 35 files
```

*refs/remotes/origin/HEAD* にアップストリームリポジトリの HEAD の参照が保存される。

```sh
> cat .git/refs/remotes/origin/HEAD
ref: refs/remotes/origin/main
```

アップストリームリポジトリのブランチは *packed-refs* に保存される。

```sh
> cat .git/packed-refs
# pack-refs with: peeled fully-peeled sorted
1f00ec0b881277dd1a3b28988921a2a6f9a51422 refs/remotes/origin/A
cb609e67f31a407a48c4826d869a0f203d6986c1 refs/remotes/origin/B
3d6320ec2e38e3e98e157b6a443f63e5766a1dbe refs/remotes/origin/main
```

## ブランチを指定

チェックアウトするブランチを指定する。

```sh
> git clone -b A work3 work4
Cloning into 'work4'...
done.
```

ログを確認する。

```sh
> git log --oneline --all
3d6320e (origin/main, origin/HEAD) 7
a2e57f8 6
cb609e6 (origin/B) 5
1f00ec0 (HEAD -> A, origin/A) 4
ddb8418 3
3c7eeeb 2
538b83e 1
```

## コミットの深さを指定 (shallow clone)

1 つのコミットのみクローンする。ローカルリポジトリはサポートしていないため *file://* を使用する。

```sh
> git clone --depth 1 file:///root/workspace/work3 work4
Cloning into 'work4'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (3/3), done.
```

ログを確認する。
最新のコミットに関連する情報のみ取得する。
それ以外のコミット、ブランチの情報はない。

```sh
> git log --oneline --all
3d6320e (grafted, HEAD -> main, origin/main, origin/HEAD) 7
```

すべてのブランチを取得するには `--no-single-branch` オプションを付ける。

```sh
> git clone --depth 1 --no-single-branch file:///root/workspace/work3 work4
Cloning into 'work4'...
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 5 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (5/5), 498 bytes | 498.00 KiB/s, done.
```

ログを確認する。

```sh
> git log --oneline --all
3d6320e (grafted, HEAD -> main, origin/main, origin/HEAD) 7
cb609e6 (grafted, origin/B) 5
1f00ec0 (grafted, origin/A) 4
```

すべての履歴を取得するには [git fetch](./git-fetch.md) コマンドを使用する。

```sh
> git fetch --unshallow
remote: Enumerating objects: 4, done.
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 4 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
Unpacking objects: 100% (4/4), 488 bytes | 488.00 KiB/s, done.
```

### *.git* ディレクトリ

リポジトリを shallow チェックアウトしたときの *.git* ディレクトリを確認する。

```sh
> LANG=C tree -aF
.
|-- .git/
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
|   |       |-- heads/
|   |       |   `-- main
|   |       `-- remotes/
|   |           `-- origin/
|   |               `-- HEAD
|   |-- objects/
|   |   |-- info/
|   |   `-- pack/
|   |       |-- pack-a3fe82e896449810860d98aeb481ed6af751d3a4.idx
|   |       |-- pack-a3fe82e896449810860d98aeb481ed6af751d3a4.pack
|   |       `-- pack-a3fe82e896449810860d98aeb481ed6af751d3a4.rev
|   |-- packed-refs
|   |-- refs/
|   |   |-- heads/
|   |   |   `-- main
|   |   |-- remotes/
|   |   |   `-- origin/
|   |   |       `-- HEAD
|   |   `-- tags/
|   `-- shallow
`-- README.md

17 directories, 30 files
```

*shallow* にクローンした情報を保存する。

```sh
> cat .git/shallow
1f00ec0b881277dd1a3b28988921a2a6f9a51422
3d6320ec2e38e3e98e157b6a443f63e5766a1dbe
cb609e67f31a407a48c4826d869a0f203d6986c1
```

## ディレクトリの深さを指定 (sparse チェックアウト)

```sh
> git clone --sparse file:///root/workspace/work3 work4
Cloning into 'work4'...
remote: Enumerating objects: 9, done.
remote: Counting objects: 100% (9/9), done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 9 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (9/9), done.
Resolving deltas: 100% (2/2), done.
```

ログを確認する。

```sh
> git log --oneline --all
3d6320e (HEAD -> main, origin/main, origin/HEAD) 7
a2e57f8 6
cb609e6 (origin/B) 5
1f00ec0 (origin/A) 4
ddb8418 3
3c7eeeb 2
538b83e 1
```

### *.git* ディレクトリ

リポジトリを sparse チェックアウトしたときの *.git* ディレクトリを確認する。

```sh
> LANG=C tree -aF
.
|-- .git/
|   |-- HEAD
|   |-- branches/
|   |-- config
|   |-- config.worktree
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
|   |   |-- exclude
|   |   `-- sparse-checkout
|   |-- logs/
|   |   |-- HEAD
|   |   `-- refs/
|   |       |-- heads/
|   |       |   `-- main
|   |       `-- remotes/
|   |           `-- origin/
|   |               `-- HEAD
|   |-- objects/
|   |   |-- info/
|   |   `-- pack/
|   |       |-- pack-83e881a5b334037b0907fdade87eec3c90edfae8.idx
|   |       |-- pack-83e881a5b334037b0907fdade87eec3c90edfae8.pack
|   |       `-- pack-83e881a5b334037b0907fdade87eec3c90edfae8.rev
|   |-- packed-refs
|   `-- refs/
|       |-- heads/
|       |   `-- main
|       |-- remotes/
|       |   `-- origin/
|       |       `-- HEAD
|       `-- tags/
`-- README.md

17 directories, 31 files
```

*info/sparse-checkout* にチェックアウトした情報を保存する。

```sh
> cat .git/info/sparse-checkout
/*
!/*/
```
