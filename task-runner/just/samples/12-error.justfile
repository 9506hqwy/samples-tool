# エラーが発生すると止まる。
work-failed: failed
    @echo "work01"

failed:
    @echo "failed start"
    [ 1 -ne 1 ]
    @echo "failed end"

# "-" を付けてエラーを無視する。
work-ignore: ignore
    @echo "work01"

ignore:
    @echo "ignore start"
    -[ 1 -ne 1 ]
    @echo "ignore end"
