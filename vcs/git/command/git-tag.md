# tag コマンド

タグを付与する。

```sh
git tag <タグ>
```

## ソースコード

- [builtin/tag.c](https://github.com/git/git/blob/v2.47.1/builtin/tag.c)

## 追加

HEAD コミットにタグ v0.1.0 を追加する。

```sh
> git tag v0.1.0
```

HEAD~1 コミットにタグ v0.0.0 を追加する。

```sh
> git tag v0.0.0 HEAD~1
```

HEAD コミットにアノテーション・タグ v0.2.0 を追加する。
アノテーション・タグはメッセージが必要になる。

```sh
> git tag -a v0.2.0 -m "v0.2.0"
```

### *.git* ディレクトリ

上記の 3 つのタグを追加したときの *.git* ディレクトリを確認する。

```sh
> LANG=C tree -aF
.
`-- .git/
    |-- HEAD
    |-- ORIG_HEAD
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
    |-- index
    |-- info/
    |   `-- exclude
    |-- logs/
    |   |-- HEAD
    |   `-- refs/
    |       |-- heads/
    |       |   |-- A
    |       |   |-- B
    |       |   `-- main
    |       `-- remotes/
    |           `-- origin/
    |               `-- HEAD
    |-- objects/
    |   |-- 23/
    |   |   `-- 959f3e1e72aa8598d4c8b0126a37e17dd2093a
    |   |-- 4b/
    |   |   |-- 7da5dabc5c1c5050ad8163316b5b5bac7ab6aa
    |   |   `-- 825dc642cb6eb9a060e54bf8d69288fbee4904
    |   |-- 4e/
    |   |   `-- 22e61690fa6b824fd2563dcf9788d5860a4027
    |   |-- 56/
    |   |   `-- 3f1f588b4ae8d58cc2c816483d35ab362b3287
    |   |-- 6e/
    |   |   `-- eecbfec996c77bf5b464ad0f9e6d1a69fe539a
    |   |-- 7a/
    |   |   `-- 1f9aab9ba98bc487a30becd7c663196f125077
    |   |-- 98/
    |   |   `-- c1ffa2e88e9d41b8f992428c033ffc27cf4d65
    |   |-- 9f/
    |   |   `-- 2ad5e1586489ee1e5fde51f39a49c652846747
    |   |-- fe/
    |   |   `-- f869e7ffefd212875386c58ad76860cea3c893
    |   |-- info/
    |   `-- pack/
    |-- packed-refs
    `-- refs/
        |-- heads/
        |   |-- A
        |   |-- B
        |   `-- main
        |-- remotes/
        |   `-- origin/
        |       `-- HEAD
        `-- tags/
            |-- v0.0.0
            |-- v0.1.0
            `-- v0.2.0

26 directories, 43 files
```

*refs/tags* にタグ参照が保存される。

```sh
> cat .git/refs/tags/v0.0.0
23959f3e1e72aa8598d4c8b0126a37e17dd2093a

> cat .git/refs/tags/v0.1.0
fef869e7ffefd212875386c58ad76860cea3c893

> cat .git/refs/tags/v0.2.0
563f1f588b4ae8d58cc2c816483d35ab362b3287
```

通常のタグはコミットを示す。アノテーション・タグは tag オブジェクトを示す。
tag オブジェクトはコミットを示す。コミットに時間が含まれるため同じコミットを再作成しても別の tag オブジェクトになる。

```sh
> git cat-file -t 23959f3e1e72aa8598d4c8b0126a37e17dd2093a
commit

> git cat-file -t 563f1f588b4ae8d58cc2c816483d35ab362b3287
tag

> git cat-file -p 563f1f588b4ae8d58cc2c816483d35ab362b3287
object fef869e7ffefd212875386c58ad76860cea3c893
type commit
tag v0.2.0
tagger root <root@home.local> 1756119846 +0900

v0.2.0
```

アノテーション・タグは参照を表示したときに tag と commit オブジェクトが表示される。

```sh
> git show v0.2.0
tag v0.2.0
Tagger: root <root@home.local>
Date:   Mon Aug 25 20:04:06 2025 +0900

v0.2.0

commit fef869e7ffefd212875386c58ad76860cea3c893 (HEAD -> main, tag: v0.2.0, tag: v0.1.0, origin/HEAD, origin/B, B)
Author: root <root@home.local>
Date:   Thu Apr 3 20:06:51 2025 +0900

    6
```

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

タグをすべて表示する。

```sh
> git tag
v0.0.0
v0.1.0
v0.2.0
```

指定した名前を含むタグを表示する。

```sh
> git tag -l 'v0.1*'
v0.1.0
```

指定したコミットを履歴に持つタグを表示する。

```sh
> git tag -l --contains fef869e
v0.1.0
v0.2.0

> git tag -l --contains 23959f3
v0.0.0
v0.1.0
v0.2.0
```

## ソート

ソートに使用する項目を `--sort` オプションに指定する。
複数の項目を指定した場合は最後の項目が主キーになる。

指定可能な項目は [valid_atom](https://github.com/git/git/blob/v2.47.1/ref-filter.c#L946-L992) に定義されている。
既定の項目は [refname](https://github.com/git/git/blob/v2.47.1/builtin/tag.c#L542) となる。

既定は昇順で、項目の前に `-` を付けると降順でソートする。

`version::refname` または `v:refname` はタグ名を [バージョン番号と扱ってソート](https://github.com/git/git/blob/v2.47.1/versioncmp.c#L120) する。
[git config](./git-config.md) で `versionsort.suffix=-` が指定されている場合は <バージョン>-<プレリリース> 形式のタグは <バージョン> 形式のタグよりも前にソートされる。

バージョン番号として降順にソートする。

```sh
> git tag -l --sort=-v:refname
v0.2.0
v0.1.0
v0.0.0
```

## フォーマット

表示する項目を `--format` オプションに指定する。

指定可能な項目はソートと同じで既定値は `%(refname:lstrip=2)` となる。

```sh
> git tag -l --sort=authordate --format="%(refname) %(authordate:short)"
refs/tags/v0.2.0
refs/tags/v0.0.0 2025-04-03
refs/tags/v0.1.0 2025-04-03
```
