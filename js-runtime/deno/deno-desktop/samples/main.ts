if (Deno.BrowserWindow) {
    const win = new Deno.BrowserWindow({ title: "Deno Sample" });
    win.addEventListener("close", e => {
        e.preventDefault();
        win.close();
    });
}

Deno.serve(() =>
    new Response("<h1>Hello, World</h1>", {
        headers: { "content-type": "text/html" },
    })
);
