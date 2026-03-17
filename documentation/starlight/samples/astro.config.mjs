// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import starlightGitHubAlerts from 'starlight-github-alerts'
import starlightVersions from 'starlight-versions'

// https://astro.build/config
export default defineConfig({
    redirects: {
        '/': '/en/intro/',
    },
    integrations: [
        starlight({
            title: 'Starlight/Astro Samples',
            defaultLocale: 'en',
            locales: {
                en: {
                    label: 'English',
                },
                ja: {
                    label: '日本語',
                },
            },
            sidebar: [
                { slug: 'intro' },
                { slug: 'graph_table' },
                { slug: 'link' },
                { slug: 'reference' },
            ],
            plugins: [
                starlightGitHubAlerts(),
                starlightVersions({
                    versions: [
                        { slug: '0.1.0' },
                    ],
                    current: {
                        label: 'Next',
                    },
                }),
            ],
        }),
    ],
});
