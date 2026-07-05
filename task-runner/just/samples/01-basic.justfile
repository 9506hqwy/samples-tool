# 引数なしで実行した場合は最初のレシピが実行される。
hello-world:
    @echo "Hello, World!"

hello-world-ja:
    @echo "こんにちは、世界！"

hello-world-multi:
    @for name in World 世界; \
    do \
        echo "Hello, ${name}!"; \
    done

# レシピに @ を付けると実行時にコマンドが表示されなくなる。
@hello-quiet:
    echo "Hello, World!"

# エイリアスを指定する。
alias h := hello-world-multi

# shebang を指定してスクリプトを実行する。
# shebang を指定しない場合は行単位で実行される。
hello-world-py:
    #!/usr/bin/env python3
    print("Hello, World!")

# shebang を指定して複数行のコマンドを記述する。
hello-world-bash:
    #!/bin/bash
    for name in World 世界
    do
        echo "Hello, ${name}!"
    done
