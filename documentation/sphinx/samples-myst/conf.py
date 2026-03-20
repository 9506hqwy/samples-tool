# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Sphinx Samples'
copyright = '2026, 9506hqwy'
author = '9506hqwy'
release = '0.1.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'myst_parser',
    'sphinx_rtd_theme',
    'sphinxext.rediraffe',
]

templates_path = ['_templates']
exclude_patterns = [
    '_build',
    '.venv',
]

source_suffix = {
    '.rst': 'restructuredtext',
    '.md': 'markdown',
}

# Numbering of figure and table.
numfig = True
numfig_secnum_depth = 0

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']
html_context = {
    'init_version' : 'next',
    'init_locale' : 'en',
    'versions' : {
       '0.1.0': ['en', 'ja', ],
       'next': ['en', 'ja',],
    },
}

# -- Options for redirects ---------------------------------------------------
# https://sphinxext-rediraffe.readthedocs.io/en/latest/

root_doc = 'next/en/index'
rediraffe_redirects = {
    'index.md': 'next/en/index.md',
}

# -- Options for MyST --------------------------------------------------------
# https://myst-parser.readthedocs.io/en/latest/configuration.html

myst_enable_extensions = [
    'colon_fence',
]
