# 引数にプレフィックス $ が付く場合は環境変数になる。
hello $target:
    @echo "Hello, ${target}!"

# 環境変数を定義する。
export env01 := "World"
hello-export:
    @echo "Hello, ${env01}!"

# 環境変数を定義する。
[env("env02", "World")]
hello-attr:
    @echo "Hello, ${env02}!"
