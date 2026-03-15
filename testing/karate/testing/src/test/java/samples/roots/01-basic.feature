Feature: 基本

    @readonly
    Scenario: HTTP GET
        Given url baseUrl
        And path "anything", "id"
        And header x-sample-value = "header1"
        And param key1 = "value1"
        And param key2 = "value2"
        When method get
        Then status 200
        # レスポンスボディを確認。
        And match response.url == baseUrl + "/anything/id?key1=value1&key2=value2"
        And match response.args == { key1: "value1", key2: "value2" }
        And match response.headers["X-Sample-Value"] == "header1"

        # headers と params は JSON 形式で指定。
        Given url baseUrl
        And path "anything", "id"
        And headers { x-sample-value: "header1" }
        And params { key1: "value1", key2: "value2" }
        When method get
        Then status 200
        # レスポンスボディを確認。
        And match response.url == baseUrl + "/anything/id?key1=value1&key2=value2"
        And match response.args == { key1: "value1", key2: "value2" }
        And match response.headers["X-Sample-Value"] == "header1"

    @readwrite
    Scenario: HTTP POST
        Given url baseUrl
        And path "anything"
        And request
            """
            {
                key1: "value1",
                key2: "value2",
            }
            """
        When method post
        Then status 200
        # レスポンスボディを確認。
        And match response.json == { key1: "value1", key2: "value2" }

        # HTTP ステータスコードを使用する。
        * def httpStatus = responseStatus
        * match [200] contains httpStatus

        # レスポンスヘッダを使用する。
        * def resHeader = responseHeaders['Content-Type']
        * match resHeader[0] == "application/json"

        # レスポンスタイプを使用する。
        * def resType = responseType
        * match resType == "json"

        # レスポンスボディのバイナリを使用する。
        * def resBytes = responseBytes
        * match resBytes.length == parseInt(responseHeaders['Content-Length'][0])

    @readwrite
    Scenario: HTTP DELETE
        Given url baseUrl
        And path "status", 204
        When method delete
        Then status 204
        # レスポンスボディを確認。
        And match response == ""

        # リクエスト時間
        * print "Request Time [Epoch]:", requestTimeStamp

        # 経過時間
        * print "Elapse Time [ms]:", responseTime
