# push コマンド

ローカルリポジトリの情報をアップストリームリポジトリに送信する。

```sh
git push <アップストリームリポジトリ>
```

アップストリームリポジトリを省略した場合はカレントブランチが追跡しているリモートトラッキングブランチのリポジトリとなる。
指定がなければ origin となる。

refspec の指定がない場合は `push.default` の設定に従う。
`simple` の場合はカレントブランチと同じ名前のアップストリームリポジトリのブランチとなる。

## ソースコード

- [builtin/push.c](https://github.com/git/git/blob/v2.47.1/builtin/push.c)

## ローカルリポジトリの main ブランチを送信

ローカルリポジトリの main ブランチを origin アップストリームリポジトリに送信する。

空のリモートベアリポジトリ(*work3*)を origin 登録して送信する。
トラッキングブランチがないので送信が成功したら追跡する。

```sh
> git remote -v
origin  file:///root/workspace/work3 (fetch)
origin  file:///root/workspace/work3 (push)

> git push -u origin main
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 2 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (9/9), 874 bytes | 874.00 KiB/s, done.
Total 9 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
To file:///root/workspace/work3
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.

> git branch -a
* main
  remotes/origin/main
```

*.git/config* にトラッキングブランチが設定される。

```ini
[branch "main"]
        remote = origin
        merge = refs/heads/main
```
