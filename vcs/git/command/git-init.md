# init コマンド

リポジトリを作成する。

```sh
git init [<ディレクトリ>]
```

## ソースコード

- [builtin/init-db.c](https://github.com/git/git/blob/v2.47.1/builtin/init-db.c)

## *.git* ディレクトリ

*.git* ディレクトリの初期状態を確認する。

リポジトリを作成する。

```sh
> git init -b main work
Initialized empty Git repository in /root/workspace/work/.git/
```

ファイル構造を確認する。

```sh
> LANG=C tree -aF work/
work/
`-- .git/
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
    |-- objects/
    |   |-- info/
    |   `-- pack/
    `-- refs/
        |-- heads/
        `-- tags/

10 directories, 18 files
```

`HEAD` は main ブランチを参照している。

```sh
> cat work/.git/HEAD
ref: refs/heads/main
```

リポジトリの設定を確認する。

```sh
> cat work/.git/config
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
```

リポジトリの説明はない。

```sh
> cat work/.git/description
Unnamed repository; edit this file 'description' to name the repository.
```

リポジトリ単位で管理対象外にするファイルは指定されていない([参照](../config/gitignore.md))。

```sh
> cat work/.git/info/exclude
# git ls-files --others --exclude-from=.git/info/exclude
# Lines that start with '#' are comments.
# For a project mostly in C, the following would be a good set of
# exclude patterns (uncomment them if you want to use them):
# *.[oa]
# *~
```

## リポジトリの作成

`init` コマンドを使用せずにリポジトリを作成する。

```sh
> mkdir -p .git/{branches,hooks,info,objects/info,objects/pack,refs/heads,refs/tags}
> echo 'ref: refs/heads/main' > .git/HEAD
> cat > .git/config <<EOF
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
EOF
> touch .git/description
> touch .git/info/exclude
```

リポジトリを確認する。

```sh
> git config list --local
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
```
