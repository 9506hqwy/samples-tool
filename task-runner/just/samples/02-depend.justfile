# 依存関係のレシピを指定する。
work01: depend01
    @echo "World!"

depend01:
    @echo "Hello"

# && のあとに指定したレシピは work02 の実行後の実行される。
work02: depend01 && depend02
    @echo "World"

depend02:
    @echo "!"

# "_" で始まるレシピはプライベートレシピとして扱われる。
work03: _depend03
    @echo "World!"

# プライベートレシピは他のレシピからのみ実行される。
# もしくは [private] を指定することで、プライベートレシピとして扱うことができる。
_depend03:
    @echo "Hello"
