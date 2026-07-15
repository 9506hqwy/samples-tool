# restore コマンド

ワーキングツリーを元の状態に戻す。

```sh
git restore <pathspec>
```

## ソースコード

- [builtin/checkout.c](https://github.com/git/git/blob/v2.47.1/builtin/checkout.c)

## ワーキングツリーの状態をリストア

ワーキングツリーをインデックスの状態に戻す。
ステージング状態はそのまま残る。

```sh
> git status -s
MM README.md

> git restore README.md
> git status -s
M  README.md
```

## ステージングの状態をリストア

ステージングの状態を元に戻す。変更はワーキングツリーに反映される。

```sh
> git status -s
MM README.md

> git restore --staged README.md
> git status -s
 M README.md
```

## ワーキングツリーとステージングの状態をリストア

ワーキングツリーを HEAD の状態に戻す。

```sh
> git status -s
MM README.md

> git restore --staged --worktree README.md
> git status -s
```

## 指定したコミットにリストア

コミットの状態に戻す。変更はワーキングツリーの反映される。
ファイルを追加する前のコミットを指定すると削除される。

```sh
> git restore --source=HEAD~1 README.md
> git status -s
 D README.md
```
