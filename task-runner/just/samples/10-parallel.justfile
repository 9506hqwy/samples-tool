# 並列に実行される。
[parallel]
default: work01 work02 work03

work01:
    @echo "work01"

work02:
    @echo "work02"

work03:
    @echo "work03"
