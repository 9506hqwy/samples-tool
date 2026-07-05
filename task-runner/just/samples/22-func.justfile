# 引数なしの関数を定義する。
prelude := '''
    echo "prelude"
'''

hello-world:
    @{{ prelude }}
    @echo "Hello, World!"
