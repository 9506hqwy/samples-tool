# 位置指定引数をシェル変数で指定する。
set positional-arguments

hello target:
    @echo "Hello, $1!"
