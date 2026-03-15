Feature: Karate オブジェクト

    Scenario: シナリオ01
        # シナリオを正常終了。
        * karate.abort()

    Scenario: シナリオ02
        # シナリオを異常終了。
        * karate.fail("失敗")

    Scenario: シナリオ03
        # シナリオを異常終了。
        * configure pauseIfNotPerf = true
        * karate.pause(1 * 1000)

    Scenario: シナリオ04
        # 配列を作成。
        * def json1 = { key1: "value1" }
        * def json2 = { key2: "value2" }
        * def ret = karate.append(json1, json2)
        * match ret == ([json1, json2])

        # 配列に値を追加。
        * def json3 = { key3: "value3" }
        * def ret = karate.appendTo(ret, json3)
        * match ret == ([json1, json2, json3])

    Scenario: シナリオ05
        # フィルタ。
        * def arr1 = karate.range(1, 3)
        * def ret = karate.filter(arr1, v => v % 2 == 0)
        * match ret == ([2])

        # キーでフィルタ。
        * def json1 = { key1: "value1", key2: "value2" }
        * def ret = karate.filterKeys(json1, ["key1"])
        * match ret == { key1: "value1" }

        # マップ。
        * def arr2 = [1, 2, 3]
        * karate.forEach(arr2, v => karate.log(v))

        * def arr3 = [1, 2, 3]
        * def ret = karate.map(arr3, v => v * 2)
        * match ret == ([2, 4, 6])

        # マージ。
        * def json1 = { key1: "value1" }
        * def json2 = { key2: "value2" }
        * def ret = karate.merge(json1, json2)
        * match ret == { key1: "value1", key2: "value2" }

    Scenario: シナリオ06
        * def json1 = { key1: "value1", key2: "value2" }

        # サイズ。
        * match karate.sizeOf(json1) == 2

        # キーのみ。
        * match karate.keysOf(json1) == ["key1", "key2"]

        # 値のみ。
        * match karate.valuesOf(json1) == ["value1", "value2"]

    Scenario: シナリオ07
        # 環境名。
        # -Dkarate.env で指定した値。
        * print karate.env

        # OS 情報。
        # { name: #string, type: #string }
        * print karate.os

        # Epoch Time。
        # null ？
        * print karate.systemTime

        # コマンド実行。
        * print karate.exec("echo test")

    Scenario: シナリオ08
        # feature オブジェクト。
        * print karate.feature

        # シナリオ オブジェクト。
        * print karate.scenario

        # タス名。
        * print karate.tags

    Scenario: シナリオ09
        * def targetUrl = "http://127.0.0.1/パス?キー=値"

        # URL エンコード。
        * def encoded = karate.urlEncode(targetUrl)
        * def decoded = karate.urlDecode(encoded)
        * match decoded == targetUrl
