Feature: ライフサイクル

    # 実行順序
    # ※ Background はすべてのシナリオ前に実行されるため省略。
    #
    # 1. Global Scenario 01
    # 2. Pre Scenario 01
    # 3. Scenario 01
    # 4. Scenario 01 (afterScenario)
    # 5. Scenario 02
    # 6. Scenario 02 (afterScenario)
    # 7. afterFeature

    Background: Background は各シナリオ前に実行
        * print "Backgound:", new Date().toISOString()

        # 各シナリオ後に実行される関数を登録。
        * configure afterScenario =
            """
            function() {
                karate.log("afterScenario: ", new Date().toISOString())
            }
            """

        # すべてのシナリオ後に実行される関数を登録。
        * configure afterFeature =
            """
            function() {
                karate.log("afterFeature: ", new Date().toISOString())
            }
            """

    Scenario: シナリオ01
        * callonce read("@prescenario")
        * print "Scenario 01:", new Date().toISOString()

    Scenario: シナリオ02
        * callonce read("@prescenario")
        * print "Scenario 02:", new Date().toISOString()

    @ignore
    @prescenario
    Scenario: feature ごとに一回のみ実行
        # 結果はキャッシュされ何回呼ばれても実行は一回のみ。
        # Background も実行される。そのため再起呼び出しに注意。
        * print "Pre Scenario 01:", new Date().toISOString()

    @ignore
    @global
    Scenario: すべての feature 前に一回のみ実行
        # 結果はキャッシュされ何回呼ばれても実行は一回のみ。
        # Background も実行される。
        * def now = new Date().toISOString()
        * print "Global Scenario 01:", now
