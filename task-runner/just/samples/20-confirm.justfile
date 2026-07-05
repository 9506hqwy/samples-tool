# 実行前に確認する。
# Run recipe `レシピ名`?
[confirm]
hello-world:
    @echo "Hello, World!"

# メッセージを指定する。
# message ? [y/n]
[confirm("message ? [y/n]")]
hello-world-msg:
    @echo "Hello, World!"
