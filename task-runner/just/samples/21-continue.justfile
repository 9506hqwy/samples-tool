# SIGINT を受信した場合もコマンドが正常終了するなら cleanup が実行される。
[continue("SIGINT")]
sleep: && cleanup
    sleep 30

cleanup:
    @echo "cleanup"
