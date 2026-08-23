import { defineConfig } from "blume";

export default defineConfig({
    title: "Blume Samples",
    description: "Documentation powered by Blume.",
    i18n: {
        defaultLocale: "en",
        locales: [
            { code: "en", label: "English" },
            { code: "ja", label: "Japanese" },
        ],
    },
    ai: {
        llmsTxt: false,
        openInChat: false,
    },
    export: true,
    feedback: false,
    redirects: [
        {
            "from": "/",
            "to": "/intro/",
        },
    ],
    versions: {
        current: { label: "next" },
        archived: [
            { id: "v0.1.0" },
        ],
    }
});
