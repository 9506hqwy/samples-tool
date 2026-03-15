function fn() {
    let env = karate.env || "dev";
    karate.log("karate.env system property was:", env);

    let config = {
        env: env,
        // -Dproperty を取得
        baseUrl: karate.properties["baseUrl"],
        // 環境変数を取得
        apiKey: java.lang.System.getenv("API_KEY"),

        getTimestamp: function () {
            return new Date().toISOString();
        }
    }

    // すべての feature 前に一回のみ実行される。
    let ret = karate.callSingle("classpath:samples/roots/07-lifecycle.feature@global");
    // ここはシナリオごとに実行される。
    karate.log("Global Once: ", ret);
    karate.configure("readTimeout", 5000);

    return config;
}
