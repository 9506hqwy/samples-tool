Feature: パラメータ化

    Scenario Outline: HTTP GET
        Given url baseUrl
        And path "status", <status>
        When method get
        Then status <status>

        Examples:
            | status |
            | 200    |
            | 201    |
            | 204    |
