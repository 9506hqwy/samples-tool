# new コマンド

「change」を新規作成する。

```sh
jj new
```

```text
Working copy  (@) now at: qolrzlls 0ce34734 (empty) (no description set)
Parent commit (@-)      : qqzvonsz b20a3692 (empty) Initial commit.
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
|   |   |   |-- 7a9ebc8c9f96f0611edb620611ae045de8fb7d88765245b61a36af3172a5c6bb1ffbc0647fffe62c9f4d8895b995dc7234cb9563bb6600decd654f0850b96cf4
|   |   |   `-- b224cf3db48ca9030287869cf0f4c7333f0fdfea69f093d67e5babf56685fa526616a7e84dadda8481d626a23dc91f7b2fee83127c0926fcc0c3e64e9c821329
|   |   |-- segments/
|   |   |   |-- 0f35587779d5d0a1991361ef5264f9f82b361a8b13fe06b2d946780fe18f8962e279c46761d78f9735b445ef7ee2693806cad7e543f0e9b7f28f1d575ad18dce
|   |   |   |-- 1056f0ea7414a099831a1f59c141388d1d89157d185c411f93a0f1a443b0d8561c54f9e81038d21ef821e3cb4fbf09ee0ff01ffb5b1051d8425342104618be11
|   |   |   |-- 96b6303710abd3e577ffd105a333682066d099d1f478f748f0b3a590b4932ebad36707c01683a7be6a9d3c1dbf21d56f19f9812650f09d7634e3a99a74890a44
|   |   |   `-- d27ad326963b75736b636adad9fb812eb3f2871e0efb4bc7db37d4b701a4282911eaaee91bed3a759e940769b667be1ed66f2d7f2f41ac3906b87ab7eec19c3a
|   |   `-- type
|   |-- op_heads/
|   |   |-- heads/
|   |   |   `-- b224cf3db48ca9030287869cf0f4c7333f0fdfea69f093d67e5babf56685fa526616a7e84dadda8481d626a23dc91f7b2fee83127c0926fcc0c3e64e9c821329
|   |   `-- type
|   |-- op_store/
|   |   |-- operations/
|   |   |   |-- 12b28482964c246d571ed0776108dd1728b32715089bfcb9d0a41af140017cbc960dad035d7730c3dc177f30ec793d6223908e4e8f5d7769b098a6b9d34019e2
|   |   |   |-- 7a9ebc8c9f96f0611edb620611ae045de8fb7d88765245b61a36af3172a5c6bb1ffbc0647fffe62c9f4d8895b995dc7234cb9563bb6600decd654f0850b96cf4
|   |   |   `-- b224cf3db48ca9030287869cf0f4c7333f0fdfea69f093d67e5babf56685fa526616a7e84dadda8481d626a23dc91f7b2fee83127c0926fcc0c3e64e9c821329
|   |   |-- type
|   |   `-- views/
|   |       |-- 36ac79b14eb3377f0f36fb99033a944f88bf2f470aae3b6f5d4bcd0ddf28e51bf7d1e3e57c2679482390bd3d0d489952ff63d2b7dc99fb067721805945683a36
|   |       |-- 3baaaea977929729f233c04ec3f07509e4d85222901234af00d876f5ba1cbc6debdf36773fbcc1fd2ef2ec8be4b859290b347238f08d43feb21dcf5de62ef002
|   |       `-- b8ef3056f9a85acbe8bf417fe249028d37fc5338bb68b89dd1bb64803697baaa119e50d5eab0212f46cbe6e79e59317e5da7a2b7112f233c36e38dfd41f7887d
|   |-- store/
|   |   |-- extra/
|   |   |   |-- 482ae5a29fbe856c7272f2071b8b0f0359ee2d89ff392b8a900643fbd0836eccd067b8bf41909e206c90d45d6e7d8b6686b93ecaee5fe1a9060d87b672101310
|   |   |   |-- 9d19cd5e1c40bb0518a85b06b555da61b8fad517cba204c6938c577c09272c13809d6cc3cfa5323e8a11557db1aef6abe75e5d2e10079fe7d00bff547577f7f4
|   |   |   |-- e3c352eb5509d48693dbd14695ba0d603fb20aa19464b4f9d5c6299f9f8634934efd4161459fd406d0cbb5ef4e6e2aff9ef1e2112070543a3c42e94680ee729a
|   |   |   |-- f9ff54b35a4d42d892928b1b6adfff76e719429df18a39d40e7c71c82636b58bab98e8d9c4a98031e01cd4af19ec135d126f31a07c544c64e87dbf9d5edf6f3c
|   |   |   `-- heads/
|   |   |       `-- 9d19cd5e1c40bb0518a85b06b555da61b8fad517cba204c6938c577c09272c13809d6cc3cfa5323e8a11557db1aef6abe75e5d2e10079fe7d00bff547577f7f4
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

17 directories, 31 files
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
|-- logs/
|   `-- HEAD
|-- objects/
|   |-- 0c/
|   |   `-- e347342b2058d7cfd3de3bd76cab58ef8b0605
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
    |       |-- 0ce347342b2058d7cfd3de3bd76cab58ef8b0605
    |       |-- 99e438723fa74c100adb08bda7c792c9c1788b3c
    |       `-- b20a369242bbf72f9293df1aba0d5d1a7eb5afba
    `-- tags/

16 directories, 24 files
```

refs/jj/keep の参照を確認する。

```sh
git cat-file -p 0ce347342b2058d7cfd3de3bd76cab58ef8b0605
```

```text
tree 4b825dc642cb6eb9a060e54bf8d69288fbee4904
parent b20a369242bbf72f9293df1aba0d5d1a7eb5afba
author root <root@home.local> 1784123487 +0000
committer root <root@home.local> 1784123487 +0000
change-id qolrzllspryklwtxqkzrwqyzmumnzlqx
```

HEAD を確認する。

```sh
cat .git/HEAD
```

```text
b20a369242bbf72f9293df1aba0d5d1a7eb5afba
```

HEAD が参照するコミットがあるため git でコミットを確認する。

```sh
git show
```

```text
commit b20a369242bbf72f9293df1aba0d5d1a7eb5afba (HEAD)
Author: root <root@home.local>
Date:   Wed Jul 15 13:35:18 2026 +0000

    Initial commit.
```
