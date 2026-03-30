#!/bin/sh

ROOT="$(dirname $0)/.."

pushd "${ROOT}"

apt-get update
apt-get install -y fonts-ipaexfont
kanji-config-updmap-sys ipaex

pip install .
sphinx-build -M latexpdf . _build

popd
