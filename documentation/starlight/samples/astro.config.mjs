// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import starlightGitHubAlerts from 'starlight-github-alerts'
import starlightVersions from 'starlight-versions'
import pdf from 'astro-pdf'

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
        pdf({
            pages: {
                '/en/intro': {},
                '/en/graph_table': {},
                '/en/link': {},
                '/en/reference': {},
                '/ja/intro': {},
                '/ja/graph_table': {},
                '/ja/link': {},
                '/ja/reference': {},
            },
            launch: {
                args: ['--no-sandbox'],
            },
            baseOptions: {
                path: '/pdf[pathname].pdf',
                throwOnFail: true,
                waitUntil: 'networkidle0',
                pdf: {
                    format: 'A4'
                },
            },
        }),
    ],
});
