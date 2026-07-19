# describe コマンド

「change」を更新する。

説明を更新する。
「change ID」は変更しないが「commit ID」は更新される。

```sh
jj describe -m "Initial commit."
```

```text
Working copy  (@) now at: qqzvonsz b20a3692 (empty) Initial commit.
Parent commit (@-)      : zzzzzzzz 00000000 (empty) (no description set)
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
|   |   |   |-- 12b28482964c246d571ed0776108dd1728b32715089bfcb9d0a41af140017cbc960dad035d7730c3dc177f30ec793d6223908e4e8f5d7769b098a6b9d34019e2
|   |   |   `-- 7a9ebc8c9f96f0611edb620611ae045de8fb7d88765245b61a36af3172a5c6bb1ffbc0647fffe62c9f4d8895b995dc7234cb9563bb6600decd654f0850b96cf4
|   |   |-- segments/
|   |   |   |-- 0f35587779d5d0a1991361ef5264f9f82b361a8b13fe06b2d946780fe18f8962e279c46761d78f9735b445ef7ee2693806cad7e543f0e9b7f28f1d575ad18dce
|   |   |   |-- 1056f0ea7414a099831a1f59c141388d1d89157d185c411f93a0f1a443b0d8561c54f9e81038d21ef821e3cb4fbf09ee0ff01ffb5b1051d8425342104618be11
|   |   |   `-- d27ad326963b75736b636adad9fb812eb3f2871e0efb4bc7db37d4b701a4282911eaaee91bed3a759e940769b667be1ed66f2d7f2f41ac3906b87ab7eec19c3a
|   |   `-- type
|   |-- op_heads/
|   |   |-- heads/
|   |   |   `-- 7a9ebc8c9f96f0611edb620611ae045de8fb7d88765245b61a36af3172a5c6bb1ffbc0647fffe62c9f4d8895b995dc7234cb9563bb6600decd654f0850b96cf4
|   |   `-- type
|   |-- op_store/
|   |   |-- operations/
|   |   |   |-- 12b28482964c246d571ed0776108dd1728b32715089bfcb9d0a41af140017cbc960dad035d7730c3dc177f30ec793d6223908e4e8f5d7769b098a6b9d34019e2
|   |   |   `-- 7a9ebc8c9f96f0611edb620611ae045de8fb7d88765245b61a36af3172a5c6bb1ffbc0647fffe62c9f4d8895b995dc7234cb9563bb6600decd654f0850b96cf4
|   |   |-- type
|   |   `-- views/
|   |       |-- 3baaaea977929729f233c04ec3f07509e4d85222901234af00d876f5ba1cbc6debdf36773fbcc1fd2ef2ec8be4b859290b347238f08d43feb21dcf5de62ef002
|   |       `-- b8ef3056f9a85acbe8bf417fe249028d37fc5338bb68b89dd1bb64803697baaa119e50d5eab0212f46cbe6e79e59317e5da7a2b7112f233c36e38dfd41f7887d
|   |-- store/
|   |   |-- extra/
|   |   |   |-- 482ae5a29fbe856c7272f2071b8b0f0359ee2d89ff392b8a900643fbd0836eccd067b8bf41909e206c90d45d6e7d8b6686b93ecaee5fe1a9060d87b672101310
|   |   |   |-- e3c352eb5509d48693dbd14695ba0d603fb20aa19464b4f9d5c6299f9f8634934efd4161459fd406d0cbb5ef4e6e2aff9ef1e2112070543a3c42e94680ee729a
|   |   |   |-- f9ff54b35a4d42d892928b1b6adfff76e719429df18a39d40e7c71c82636b58bab98e8d9c4a98031e01cd4af19ec135d126f31a07c544c64e87dbf9d5edf6f3c
|   |   |   `-- heads/
|   |   |       `-- f9ff54b35a4d42d892928b1b6adfff76e719429df18a39d40e7c71c82636b58bab98e8d9c4a98031e01cd4af19ec135d126f31a07c544c64e87dbf9d5edf6f3c
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

17 directories, 26 files
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
|-- index
|-- info/
|   `-- exclude
|-- objects/
|   |-- 4b/
|   |   `-- 825dc642cb6eb9a060e54bf8d69288fbee4904
|   |-- 99/
|   |   `-- e438723fa74c100adb08bda7c792c9c1788b3c
|   |-- b2/
|   |   `-- 0a369242bbf72f9293df1aba0d5d1a7eb5afba
|   |-- info/
|   `-- pack/
`-- refs/
    |-- heads/
    |-- jj/
    |   `-- keep/
    |       |-- 99e438723fa74c100adb08bda7c792c9c1788b3c
    |       `-- b20a369242bbf72f9293df1aba0d5d1a7eb5afba
    `-- tags/

14 directories, 21 files
```

refs/jj/keep の参照を確認する。

```sh
git cat-file -p b20a369242bbf72f9293df1aba0d5d1a7eb5afba
```

```text
tree 4b825dc642cb6eb9a060e54bf8d69288fbee4904
author root <root@home.local> 1784122518 +0000
committer root <root@home.local> 1784122518 +0000
change-id qqzvonsztkzmkspuwsoxtrknrrsvlxnu

Initial commit.
```
