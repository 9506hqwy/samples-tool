# git init コマンド

git 互換のリポジトリを作成する。

```sh
jj git init --colocate
```

```text
Initialized repo in "."
```

## *.jj* ディレクトリ

*.jj* ディレクトリの初期状態を確認する。

```sh
LANG=C tree -aF .jj
```

```text
.jj/
|-- .gitignore
|-- repo/
|   |-- index/
|   |   |-- changed_paths/
|   |   |-- op_links/
|   |   |   |-- 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
|   |   |   `-- 12b28482964c246d571ed0776108dd1728b32715089bfcb9d0a41af140017cbc960dad035d7730c3dc177f30ec793d6223908e4e8f5d7769b098a6b9d34019e2
|   |   |-- segments/
|   |   |   |-- 1056f0ea7414a099831a1f59c141388d1d89157d185c411f93a0f1a443b0d8561c54f9e81038d21ef821e3cb4fbf09ee0ff01ffb5b1051d8425342104618be11
|   |   |   `-- d27ad326963b75736b636adad9fb812eb3f2871e0efb4bc7db37d4b701a4282911eaaee91bed3a759e940769b667be1ed66f2d7f2f41ac3906b87ab7eec19c3a
|   |   `-- type
|   |-- op_heads/
|   |   |-- heads/
|   |   |   `-- 12b28482964c246d571ed0776108dd1728b32715089bfcb9d0a41af140017cbc960dad035d7730c3dc177f30ec793d6223908e4e8f5d7769b098a6b9d34019e2
|   |   `-- type
|   |-- op_store/
|   |   |-- operations/
|   |   |   `-- 12b28482964c246d571ed0776108dd1728b32715089bfcb9d0a41af140017cbc960dad035d7730c3dc177f30ec793d6223908e4e8f5d7769b098a6b9d34019e2
|   |   |-- type
|   |   `-- views/
|   |       `-- 3baaaea977929729f233c04ec3f07509e4d85222901234af00d876f5ba1cbc6debdf36773fbcc1fd2ef2ec8be4b859290b347238f08d43feb21dcf5de62ef002
|   |-- store/
|   |   |-- extra/
|   |   |   |-- 482ae5a29fbe856c7272f2071b8b0f0359ee2d89ff392b8a900643fbd0836eccd067b8bf41909e206c90d45d6e7d8b6686b93ecaee5fe1a9060d87b672101310
|   |   |   |-- e3c352eb5509d48693dbd14695ba0d603fb20aa19464b4f9d5c6299f9f8634934efd4161459fd406d0cbb5ef4e6e2aff9ef1e2112070543a3c42e94680ee729a
|   |   |   `-- heads/
|   |   |       `-- e3c352eb5509d48693dbd14695ba0d603fb20aa19464b4f9d5c6299f9f8634934efd4161459fd406d0cbb5ef4e6e2aff9ef1e2112070543a3c42e94680ee729a
|   |   |-- git_target
|   |   `-- type
|   |-- submodule_store/
|   |   `-- type
|   `-- workspace_store/
|       `-- index
`-- working_copy/
    |-- checkout
    |-- tree_state
    `-- type

17 directories, 21 files
```

## *.git* ディレクトリ

*.git* ディレクトリの初期状態を確認する。

```sh
LANG=C tree -aF .git
```

```text
.git/
|-- HEAD
|-- config
|-- description
|-- hooks/
|   |-- applypatch-msg.sample
|   |-- commit-msg.sample
|   |-- docs.url
|   |-- fsmonitor-watchman.sample
|   |-- post-update.sample
|   |-- pre-applypatch.sample
|   |-- pre-commit.sample
|   |-- pre-merge-commit.sample
|   |-- pre-push.sample
|   |-- pre-rebase.sample
|   `-- prepare-commit-msg.sample
|-- info/
|   `-- exclude
|-- objects/
|   |-- 4b/
|   |   `-- 825dc642cb6eb9a060e54bf8d69288fbee4904
|   |-- 99/
|   |   `-- e438723fa74c100adb08bda7c792c9c1788b3c
|   |-- info/
|   `-- pack/
`-- refs/
    |-- heads/
    |-- jj/
    |   `-- keep/
    |       `-- 99e438723fa74c100adb08bda7c792c9c1788b3c
    `-- tags/

13 directories, 18 files
```

git の `HEAD` は main ブランチを参照している。

```sh
cat work/.git/HEAD
```

```text
ref: refs/heads/main
```

リポジトリの設定を確認する。

```sh
cat work/.git/config
```

```ini
[core]
        filemode = true
        bare = false
        logallrefupdates = true
        symlinks = true
        ignorecase = false
        precomposeunicode = false
        repositoryformatversion = 0
```

refs/jj/keep の参照を確認する。

```sh
git cat-file -p 99e438723fa74c100adb08bda7c792c9c1788b3c
```

```text
tree 4b825dc642cb6eb9a060e54bf8d69288fbee4904
author root <root@home.local> 1784117316 +0000
committer root <root@home.local> 1784117316 +0000
change-id qqzvonsztkzmkspuwsoxtrknrrsvlxnu
```
