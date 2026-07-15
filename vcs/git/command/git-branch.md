# branch コマンド

ブランチを管理する。

```sh
git branch
```

## ソースコード

- [builtin/branch.c](https://github.com/git/git/blob/v2.47.1/builtin/branch.c)

## 表示

ログを確認する。

```sh
> git log --oneline --all --graph
* fef869e (HEAD -> main, tag: v0.2.0, tag: v0.1.0, origin/HEAD, origin/B, B) 6
* 23959f3 (tag: v0.0.0, origin/main) 3
| * 7a1f9aa (origin/A, A) 5
| * 6eeecbf 4
|/
* 4b7da5d 2
* 98c1ffa 1
```

ローカルブランチを表示する。

```sh
> git branch
  A
  B
* main
```

リモートトラッキングブランチを表示する。

```sh
> git branch -r
  origin/A
  origin/B
  origin/HEAD -> origin/B
  origin/main
```

マージ済みブランチを表示する。

```sh
> git branch --merged
  B
* main
```

指定した名前を含むタグを表示する。

```sh
> git branch -l 'A*'
  A
```

指定したコミットを履歴に持つブランチを表示する。

```sh
> git branch --contains fef869e
  B
* main

> git branch --contains 6eeecb
  A
```

現在のブランチを表示する。

```sh
> git branch --show-current
main
```

## コピー

ブランチをコピーする。トラッキング状況もコピーされる。
同名のブランチがある場合もコピーする場合は `-C` オプションを指定する。

```sh
> git branch -c A D

> git branch -vv
  A    7a1f9aa [origin/A] 5
  B    fef869e 6
  D    7a1f9aa [origin/A] 5
* main fef869e [origin/main: ahead 1] 6
```

## 名前の変更

ブランチ名を変更する。トラッキング状況は変わらない。
同名のブランチがある場合も変更する場合は `-M` オプションを指定する。

```sh
> git branch -m D E

> git branch -vv
  A    7a1f9aa [origin/A] 5
  B    fef869e 6
  E    7a1f9aa [origin/A] 5
* main fef869e [origin/main: ahead 1] 6
```

## 削除

ローカルブランチを削除する。

```sh
> git branch -d B
Deleted branch B (was fef869e).
```

未マージのブランチを削除する場合は `-D` オプションを指定する。

```sh
# ブランチ C を作成
> git branch C A

> git branch -d C
error: the branch 'C' is not fully merged
hint: If you are sure you want to delete it, run 'git branch -D C'
hint: Disable this message with "git config advice.forceDeleteBranch false"

> git branch -D C
Deleted branch C (was 7a1f9aa).
```

[git fetch](./git-fetch.md) 済みのリモートトラッキングブランチを削除する。アップストリームリポジトリのブランチは削除されない。

アップストリームリポジトリのブランチを削除するには [git push](./git-push.md) の `--delete` オプションを使用する。

```sh
> git branch -r -d origin/B
Deleted remote-tracking branch origin/B (was fef869e).

> git branch -r
  origin/A
  origin/main

> git remote show origin
* remote origin
  Fetch URL: /root/workspace/work
  Push  URL: /root/workspace/work
  HEAD branch: main
  Remote branches:
    A    tracked
    B    new (next fetch will store in remotes/origin)
    C    new (next fetch will store in remotes/origin)
    main tracked
  Local branches configured for 'git pull':
    A    merges with remote A
    main merges with remote main
  Local refs configured for 'git push':
    A    pushes to A    (up to date)
    B    pushes to B    (up to date)
    main pushes to main (fast-forwardable)
```

## トラッキング

トラッキングを解除する。

```sh
> git branch --unset-upstream A

> git branch -vv
  A    7a1f9aa 5
  B    fef869e 6
* main fef869e [origin/main: ahead 1] 6
```

トラッキングを設定する。

```sh
> git branch --set-upstream-to origin/A A
branch 'A' set up to track 'origin/A'.

> git branch -vv
  A    7a1f9aa [origin/A] 5
  B    fef869e 6
* main fef869e [origin/main: ahead 1] 6
```

## ソート

[git tag](./git-tag.md) と同様。

```sh
> git branch --sort=-refname
* main
  B
  A
```

## フォーマット

[git tag](./git-tag.md) と同様。

```sh
> git branch --sort=authordate --format="%(refname) %(authordate:short)"
refs/heads/A 2025-04-03
refs/heads/B 2025-04-03
refs/heads/main 2025-04-03
```
