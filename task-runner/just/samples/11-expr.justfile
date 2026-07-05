# 変数代入に条件式を使うことができる。
world := if "hello" == "hello" { "World" } else { "???" }
hello-var target=world:
    @echo "Hello, {{ target }}!"

# 評価に条件式を使うことができる。
hello-expr target=world:
    @echo "Hello, {{ if "hello" != "hello" { "World" } else { "???" } }}!"
