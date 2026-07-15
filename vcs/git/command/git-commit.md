# commit コマンド

Git データベースにファイルを登録する。

```sh
git commit
```

## ソースコード

- [builtin/commit.c](https://github.com/git/git/blob/v2.47.1/builtin/commit.c)

## *.git* ディレクトリ

ファイルを追加したときの *.git* ディレクトリを確認する。

Git データベースにファイルを追加する。

```sh
> git ls-files --stage
100644 911f4d167e7ee2199730a57ce4cd12fa34b7f9fa 0       README.md

> git commit -m "Initial commit"
[main (root-commit) b7a72de] Initial commit
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
```

ファイル構造を確認する。
[git add](./git-add.md#git-ディレクトリ) の状態と比較すると *COMMIT_EDITMSG* と *.git/objects*, *.git/refs/heads* にファイルが追加される。

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
|       |   `-- main
|       `-- tags/
`-- README.md

16 directories, 27 files
```

*COMMIT_EDITMSG* はコミットメッセージが保存されている。

```sh
> cat .git/COMMIT_EDITMSG
Initial commit
```

*refs/heads/main* は main ブランチが示すオブジェクトの SHA1 が保存されている。

```sh
> cat .git/refs/heads/main
b7a72de2bb54febf3f485d4eaed204f42c2c3feb
```

## commit オブジェクト

オブジェクト `b7a72de2bb54febf3f485d4eaed204f42c2c3feb` を確認する。

```sh
# オブジェクトのタイプ
> git cat-file -t b7a72de2bb54febf3f485d4eaed204f42c2c3feb
commit
# オブジェクトのサイズ
> git cat-file -s b7a72de2bb54febf3f485d4eaed204f42c2c3feb
159
# オブジェクトの内容
> git cat-file -p b7a72de2bb54febf3f485d4eaed204f42c2c3feb
tree 175d63f192341c2c4d5085b3c7a39c7826e3e33a
author root <root@home.local> 1742617547 +0900
committer root <root@home.local> 1742617547 +0900

Initial commit
```

commit オブジェクトは tree オブジェクト、コミット作成者、コミットメッセージを保存する。

## tree オブジェクト

オブジェクト `175d63f192341c2c4d5085b3c7a39c7826e3e33a` を確認する。

```sh
# オブジェクトのタイプ
> git cat-file -t 175d63f192341c2c4d5085b3c7a39c7826e3e33a
tree
# オブジェクトのサイズ
> git cat-file -s 175d63f192341c2c4d5085b3c7a39c7826e3e33a
37
# オブジェクトの内容
> git cat-file -p 175d63f192341c2c4d5085b3c7a39c7826e3e33a
100644 blob 911f4d167e7ee2199730a57ce4cd12fa34b7f9fa    README.md
```

tree オブジェクトは blob オブジェクトを保存する。

オブジェクト `175d63f192341c2c4d5085b3c7a39c7826e3e33a` は main ブランチが示す
コミットの tree オブジェクトのため下記の形式で指定できる。

```sh
> git cat-file -p main^{tree}
100644 blob 911f4d167e7ee2199730a57ce4cd12fa34b7f9fa    README.md
```

## コミットの作成

`commit` コマンドを使用せずにコミットを追加する。

インデックスの情報をもとに tree オブジェクトを作成する。

```sh
> git write-tree
175d63f192341c2c4d5085b3c7a39c7826e3e33a
```

tree オブジェクトを確認する。

```sh
> git cat-file -p 175d63f192341c2c4d5085b3c7a39c7826e3e33a
100644 blob 911f4d167e7ee2199730a57ce4cd12fa34b7f9fa    README.md
```

commit オブジェクトを作成する。

```sh
> echo 'Initial commit' | git commit-tree 175d63f192341c2c4d5085b3c7a39c7826e3e33a
18035f26a29419a712a88d3cb148a84d2ccf7884
```

commit オブジェクトを確認する。

```sh
> git cat-file -p 18035f26a29419a712a88d3cb148a84d2ccf7884
tree 175d63f192341c2c4d5085b3c7a39c7826e3e33a
author root <root@home.local> 1742622191 +0900
committer root <root@home.local> 1742622191 +0900

Initial commit
```

コミットを確認する。

```sh
> git show 18035f26a29419a712a88d3cb148a84d2ccf7884
commit 18035f26a29419a712a88d3cb148a84d2ccf7884
Author: root <root@home.local>
Date:   Sat Mar 22 14:43:11 2025 +0900

    Initial commit

diff --git a/README.md b/README.md
new file mode 100644
index 0000000..911f4d1
--- /dev/null
+++ b/README.md
@@ -0,0 +1 @@
+# Working
```

main ブランチの参照先コミットを設定する。

```sh
> git update-ref refs/heads/main 18035f26a29419a712a88d3cb148a84d2ccf7884
```

main ブランチを確認する。

```sh
> git log
commit 18035f26a29419a712a88d3cb148a84d2ccf7884 (HEAD -> main)
Author: root <root@home.local>
Date:   Sat Mar 22 14:43:11 2025 +0900

    Initial commit
```
