Feature: 式

    Scenario: シナリオ01
        # config の関数はそのまま実行できる。
        * print getTimestamp()

    Scenario: シナリオ02
        # javascript の式が使用できる。
        * def timestamp = new Date().toISOString()
        * print timestamp

    Scenario: シナリオ03
        # javascript の関数が定義できる。
        * def sleep =
            """
            function(sec) {
                return java.lang.Thread.sleep(sec * 1000);
            }
            """

        # 関数を実行する。
        * sleep(1)
