# pull コマンド

アップストリームリポジトリの情報を取得しワークツリーを更新する。
[git fetch](./git-fetch.md) コマンド後に [git rebase](./git-rebase.md) または [git merge](./git-merge.md) コマンドが実行される。

```sh
git pull <アップストリームリポジトリ>
```

アップストリームリポジトリを省略した場合はカレントブランチが追跡しているリモートトラッキングブランチのリポジトリとなる。

## ソースコード

- [builtin/pull.c](https://github.com/git/git/blob/v2.47.1/builtin/pull.c)

## origin リポジトリのすべてを取得

origin アップストリームリポジトリからすべてのコミット、ブランチ、タグを取得する。

空のリポジトリに [git log](./git-log.md) のリポジトリ(*work3*)を origin 登録して取得する。
トラッキングブランチがないので origin リポジトリを指定する。

```sh
> git remote -v
origin  file:///root/workspace/work3 (fetch)
origin  file:///root/workspace/work3 (push)

> git pull origin
remote: Enumerating objects: 9, done.
remote: Counting objects: 100% (9/9), done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 9 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
Unpacking objects: 100% (9/9), 854 bytes | 427.00 KiB/s, done.
From file:///root/workspace/work3
 * [new branch]      A          -> origin/A
 * [new branch]      B          -> origin/B
 * [new branch]      main       -> origin/main
You asked to pull from the remote 'origin', but did not specify
a branch. Because this is not the default configured remote
for your current branch, you must specify a branch on the command line.

> git branch -a
  remotes/origin/A
  remotes/origin/B
  remotes/origin/main
```

### *.git* ディレクトリ

リポジトリを取得したときの *.git* ディレクトリを確認する。
トラッキングブランチがないためワークツリーに変更はない。

```sh
> LANG=C tree -aF
.
`-- .git/
    |-- FETCH_HEAD
    |-- HEAD
    |-- branches/
    |-- config
    |-- description
    |-- hooks/
    |   |-- applypatch-msg.sample*
    |   |-- commit-msg.sample*
    |   |-- fsmonitor-watchman.sample*
    |   |-- post-update.sample*
    |   |-- pre-applypatch.sample*
    |   |-- pre-commit.sample*
    |   |-- pre-merge-commit.sample*
    |   |-- pre-push.sample*
    |   |-- pre-rebase.sample*
    |   |-- pre-receive.sample*
    |   |-- prepare-commit-msg.sample*
    |   |-- push-to-checkout.sample*
    |   |-- sendemail-validate.sample*
    |   `-- update.sample*
    |-- info/
    |   `-- exclude
    |-- logs/
    |   `-- refs/
    |       `-- remotes/
    |           `-- origin/
    |               |-- A
    |               |-- B
    |               `-- main
    |-- objects/
    |   |-- 1f/
    |   |   `-- 00ec0b881277dd1a3b28988921a2a6f9a51422
    |   |-- 3c/
    |   |   `-- 7eeeb9400b19cf76ea232e6cd47c7223e49d00
    |   |-- 3d/
    |   |   `-- 6320ec2e38e3e98e157b6a443f63e5766a1dbe
    |   |-- 53/
    |   |   `-- 8b83e7010d646dd160391435b3bc77f6495275
    |   |-- a2/
    |   |   `-- e57f8afbd4cebb4e444fde7956d7f9c033199e
    |   |-- cb/
    |   |   `-- 609e67f31a407a48c4826d869a0f203d6986c1
    |   |-- dd/
    |   |   `-- b8418654758fee92deacdc322b66fc36dc153d
    |   |-- e6/
    |   |   `-- 9de29bb2d1d6434b8b29ae775ad8c2e48c5391
    |   |-- f9/
    |   |   `-- 3e3a1a1525fb5b91020da86e44810c87a2d7bc
    |   |-- info/
    |   `-- pack/
    `-- refs/
        |-- heads/
        |-- remotes/
        |   `-- origin/
        |       |-- A
        |       |-- B
        |       `-- main
        `-- tags/

25 directories, 34 files
```

*FETCH_HEAD* にリモートトラッキングブランチのヘッドの情報が保存される。

```sh
# cat .git/FETCH_HEAD
1f00ec0b881277dd1a3b28988921a2a6f9a51422        not-for-merge   branch 'A' of file:///root/workspace/work3
cb609e67f31a407a48c4826d869a0f203d6986c1        not-for-merge   branch 'B' of file:///root/workspace/work3
3d6320ec2e38e3e98e157b6a443f63e5766a1dbe        not-for-merge   branch 'main' of file:///root/workspace/work3
```
