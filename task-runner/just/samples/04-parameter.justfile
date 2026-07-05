# default に指定するときは括弧で囲む。
default: (hello "World")

# レシピ名のあとに引数を定義する。
# 引数は {{ 引数名 }} で参照できる。
hello target:
    @echo "Hello, {{ target }}!"

# 引数の既定値を変数を利用して指定する。
world := "World"
hello-default target=world:
    @echo "Hello, {{ target }} in default!"

# 既定値に式を指定する場合は括弧で囲む。
# 演算子は +, &&, ||, / が使用できる。
hello-expr target=(world + " in expression"):
    @echo "Hello, {{ target }}!"

# 可変長の引数を指定する。
# 量指定子はは +, * が使用できる。
hello-quantifier +targets:
    @echo "Hello, {{ targets }}!"

# 引数の制約を正規表現で指定する。
[arg('target', pattern='[a-z]+', help="value must be lowercase letters")]
hello-def target:
    @echo "Hello, {{ target }}!"

# オプション引数を指定する。
[arg("target", long="target", short="t")]
hello-option target="world":
    @echo "Hello, {{ target }}!"

# 値を取らないオプション引数を指定する。
[arg("target", long="target", value="world")]
hello-option-default target:
    @echo "Hello, {{ target }}!"
