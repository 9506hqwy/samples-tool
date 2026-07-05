# エラーが発生したレシピのみ止める。
set guards

# "?" を付けてエラーが発生すると発生したレシピのみ止まる。
work-guards: guards
    @echo "work01"

guards:
    @echo "guards start"
    ?[ 1 -ne 1 ]
    @echo "guards end"
