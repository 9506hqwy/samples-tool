# remote コマンド

アップストリームリポジトリを管理する。

```sh
git remote
```

## ソースコード

- [builtin/remote.c](https://github.com/git/git/blob/v2.47.1/builtin/remote.c)

## URL を表示

リモート名と URL を表示する。

```sh
> git remote -v
origin  /root/workspace/work (fetch)
origin  /root/workspace/work (push)
```

## トラッキング状況を表示

ローカルとアップストリームリポジトリにあるブランチと、そのトラッキング状況を表示する。

```sh
> git remote show origin
* remote origin
  Fetch URL: /root/workspace/work
  Push  URL: /root/workspace/work
  HEAD branch: main
  Remote branches:
    A    tracked
    B    tracked
    C    new (next fetch will store in remotes/origin)
    main tracked
  Local branches configured for 'git pull':
    A    merges with remote A
    B    merges with remote B
    main merges with remote main
  Local refs configured for 'git push':
    A    pushes to A    (up to date)
    B    pushes to B    (up to date)
    main pushes to main (fast-forwardable)
```
