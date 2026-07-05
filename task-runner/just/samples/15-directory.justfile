# レシピがあるディレクトリで実行される。
default-working-directory:
    @pwd

# コマンド実行時のディレクトリで実行される。
[no-cd]
current-directory:
    @pwd

# 作業ディレクトリを指定する。
[working-directory("/")]
home-directory:
    @pwd
