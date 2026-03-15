Feature: 変数

    Scenario: シナリオ01
        # 変数を定義。
        * def number1 = 1
        * def string1 = "abc"
        * def json1 = { key1: "value1", key2: "value2" }

        # 変数 (javascript の式) を使用して値を割当。
        * def json2 =
            """
            {
                key1: "value1",
                key2: #(string1)
            }
            """

        Given url baseUrl
        And path "anything"
        And request json2
        When method post
        Then status 200
        # レスポンスボディを確認。
        And match response.json.key2 == string1

    Scenario: シナリオ02
        # テーブルで JSON を定義
        * table table1
            | key1 | key2 |
            | "value1" | "value2" |

        * match table1 == [{ key1: "value1", key2: "value2" }]

    Scenario: シナリオ03
        # 変数を定義
        * def json1 = { key1: "value1", key2: "value2" }

        # オブジェクトの代入は参照
        * def refJson = json1
        * json1.key1 = "valuex"
        * match json1.key1 == refJson.key1

        # オブジェクトのコピーは karate.toJson を使用する。
        * def copyJson1 = karate.toJson(json1)
        * copyJson1.key2 = "valuey"
        * match json1.key2 != copyJson1.key2

        # オブジェクトのコピーは copy を使用する。
        * copy copyJson2 = json1
        * copyJson2.key2 = "valuey"
        * match json1.key2 != copyJson2.key2
