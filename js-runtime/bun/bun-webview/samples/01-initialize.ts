// https://github.com/9506hqwy/template_redmine_plugin/blob/main/test/e2e/initialize.spec.ts
export {}; // Avoid warning TS1375.

await using view = new Bun.WebView({
    width: 1920,
    height: 1080,
});

await view.navigate("http://127.0.0.1:3000/");

await view.click("a.login");
while (await view.evaluate("document.querySelector('input#login-submit') === null")) {
    await Bun.sleep(100);
}

await view.click("input#username");
await view.type("admin");

await view.click("input#password");
await view.type("admin");

await view.click("input#login-submit");
while (await view.evaluate("document.querySelector('div#flash_error') === null")) {
    await Bun.sleep(100);
}

await view.click("input#password");
await view.type("admin");

await view.click("input#new_password");
await view.type("redmineadmin");

await view.click("input#new_password_confirmation");
await view.type("redmineadmin");

await view.click("input[name='commit']");
while (await view.evaluate("document.querySelector('div#flash_notice') === null")) {
    await Bun.sleep(100);
}

await Bun.write("initialize.png", await view.screenshot());
