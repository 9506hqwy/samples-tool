Feature: ヘッダ

  Background:
      # すべてのシナリオにヘッダを設定する。
      * header x-sample-valueX = "headerX"
      * configure headers = { x-sample-value1: 'header1' }

  Scenario: シナリオ01
      Given url baseUrl
      And path "headers"
      When method get
      Then status 200
      # レスポンスボディを確認。
      And match response.headers["X-Sample-Valuex"] == "headerX"
      And match response.headers["X-Sample-Value1"] == "header1"

  Scenario: シナリオ02
      Given url baseUrl
      And path "headers"
      # ヘッダを追加。
      And header x-sample-value2 = "header2"
      When method get
      Then status 200
      # レスポンスボディを確認。
      And match response.headers["X-Sample-Valuex"] == "headerX"
      And match response.headers["X-Sample-Value1"] == "header1"
      And match response.headers["X-Sample-Value2"] == "header2"

  Scenario: シナリオ03
      Given url baseUrl
      And path "headers"
      # ヘッダを更新。
      And header x-sample-valueX = "headerY"
      And header x-sample-value1 = "header3"
      When method get
      Then status 200
      # レスポンスボディを確認。
      And match response.headers["X-Sample-Valuex"] == "headerY"
      # configure headers は更新できない？
      And match response.headers["X-Sample-Value1"] == "header1"
