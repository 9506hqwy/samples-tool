# 変数が必要になったときに評価する。
# ただし export が有効な場合は遅延評価にならない。
set lazy

# 変数はコマンドを実行できる。
world := `echo "World"`
hello target=world:
    @echo "Hello, {{ target }}!"
