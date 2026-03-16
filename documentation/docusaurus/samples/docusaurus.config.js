// @ts-check

import { themes as prismThemes } from 'prism-react-renderer';

/** @type {import('@docusaurus/types').Config} */
const config = {
    title: 'Docusaurus Samples',

    url: 'https://github.com',
    baseUrl: '/9506hqwy/samples-tool/documentation/docusaurus/samples/',

    i18n: {
        defaultLocale: 'en',
        locales: ['en', 'ja'],
    },

    presets: [
        [
            'classic',
            /** @type {import('@docusaurus/preset-classic').Options} */
            ({
                docs: {
                    routeBasePath: '',
                    sidebarPath: './sidebars.js',
                    lastVersion: 'current',
                },
                theme: {
                    customCss: './src/css/custom.css',
                },
            }),
        ],
    ],

    themeConfig:
        /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
        ({
            colorMode: {
                disableSwitch: true,
            },
            navbar: {
                title: 'Docusaurus Samples',
                items: [
                    {
                        type: 'docsVersionDropdown',
                        versions: ['current', '0.1.0'],
                        position: 'right',
                    },
                    {
                        type: 'localeDropdown',
                        position: 'right',
                    },
                ],
            },
            prism: {
                theme: prismThemes.github,
            },
        }),
};

export default config;
