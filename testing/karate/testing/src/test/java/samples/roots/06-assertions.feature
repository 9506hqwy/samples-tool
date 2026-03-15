Feature: 検証

    Scenario: シナリオ01
        # == / !=
        * def number1 = 1
        * match number1 == 1
        * match number1 != 2

        * def json1 = { key1: "value1", key2: "value2" }
        * match json1 == { key1: "value1", key2: "value2" }
        * match json1 != { key1: "value1" }

    Scenario: シナリオ02
        # contains
        * def number1 = 1
        * match [1, 2] contains number1
        * match [2, 3] !contains number1

        * def json1 = { key1: "value1", key2: "value2" }
        * match json1 contains { key1: "value1", key2: "value2" }
        * match json1 contains { key1: "value1" }
        * match json1 !contains { key1: "value2" }

    Scenario: シナリオ03
        # fuzzy
        * def json1 = { key1: "value1", key2: 1, key3: null }

        # 型を確認
        # 他にも #object, #boolean, #array がある。
        * match json1 contains { key1: #string, key2: #number }

        # 値が null 以外かどうか
        * match json1 contains { key1: #notnull }

        # 値が null かどうか
        * match json1 contains { key3: #null }

        # キーが存在するかどうか
        * match json1 contains { key1: #present }

        # キーが存在しないかどうか
        * match json1 contains { key4: #notpresent }

        # fuzzy
        * def json2 = { key1: "00000000-1111-2222-3333-444444444444" }

        # uuid かどうか
        * match json2 contains { key1: #uuid }

        # 正規表現で確認
        * match json2 contains { key1: "#regex \\d{8}-\\d{4}-\\d{4}-\\d{4}-\\d{12}" }

        # 式で確認
        * match json2 contains { key1: "#? _.length == 36" }

        # fuzzy
        * def json3 = ["value1", "value2", "value3"]

        # 長さを確認
        * match json3 == "#[3]"

        # match 前に式で処理
        * match json3[0] == "#($)"

    Scenario: シナリオ04
        # fuzzy
        * def json1 = { key1: "value1", key2: 1, key3: null }

        # 値を設定
        * set json1.key4 = true
        * match json1 contains { key4: #boolean }

        # キーを削除
        * remove json1.key2
        * match json1 contains { key2: #notpresent }
