# add コマンド

ステージングエリアにファイルを登録する。

```sh
git add [<ファイル>...]
```

## ソースコード

- [builtin/add.c](https://github.com/git/git/blob/v2.47.1/builtin/add.c)

## *.git* ディレクトリ

ファイルを追加したときの *.git* ディレクトリを確認する。

ステージングエリアにファイルを追加する。

```sh
> echo "# Working" > README.md
> git add README.md
```

ファイル構造を確認する。
[git init](./git-init.md#git-ディレクトリ) の状態と比較すると *.git/index* と *.git/objects* にファイルが追加される。

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
|   |-- objects/
|   |   |-- 91/
|   |   |   `-- 1f4d167e7ee2199730a57ce4cd12fa34b7f9fa
|   |   |-- info/
|   |   `-- pack/
|   `-- refs/
|       |-- heads/
|       `-- tags/
`-- README.md

11 directories, 21 files
```

## *.git/index* ファイル

ステージングエリアを管理する。

```sh
> git ls-files --stage
100644 911f4d167e7ee2199730a57ce4cd12fa34b7f9fa 0       README.md
```

`100644` は前半の `100` はファイルの種別、後半の `644` はファイルの権限を示す。

ファイルの種別は下記がある。

| 値   | 種別                 |
| :--- | :------------------- |
| 040  | ディレクトリ         |
| 100  | ファイル             |
| 120  | シンボリックファイル |
| 160  | サブモジュール       |

`911f4d167e7ee2199730a57ce4cd12fa34b7f9fa` は対象オブジェクトの SHA1 ハッシュとなる。

0 はステージング番号となる。

```{warning}
TODO: ステージング番号とは？
```

## blob オブジェクト

blob オブジェクト `911f4d167e7ee2199730a57ce4cd12fa34b7f9fa` を確認する。

```sh
# オブジェクトのタイプ
> git cat-file -t 911f4d167e7ee2199730a57ce4cd12fa34b7f9fa
blob
# オブジェクトのサイズ
> git cat-file -s 911f4d167e7ee2199730a57ce4cd12fa34b7f9fa
10
# オブジェクトの内容
> git cat-file -p 911f4d167e7ee2199730a57ce4cd12fa34b7f9fa
# Working
```

blob オブジェクトは 下記の形式で保存される。

```text
blob <サイズ>\0<内容>
```

```sh
> cat .git/objects/91/1f4d167e7ee2199730a57ce4cd12fa34b7f9fa | openssl zlib -d
blob 10# Working
```

## ステージングエリアにファイルを追加

`add` コマンドを使用せずに、ステージングエリアにファイルを追加する。

blob オブジェクトを作成する。

```sh
> echo "# Working" | git hash-object --stdin -w
911f4d167e7ee2199730a57ce4cd12fa34b7f9fa
```

インデックスを更新する。ファイルパスは blob オブジェクトの名前を指定する。

```sh
> git update-index --add --cacheinfo 100644 911f4d167e7ee2199730a57ce4cd12fa34b7f9fa README.md
```

インデックスを確認する。

```sh
> git ls-files --stage
100644 911f4d167e7ee2199730a57ce4cd12fa34b7f9fa 0       README.md
```
