#!/bin/bash -eu

git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$PATH:$(pwd)/depot_tools

mkdir chromium && cd chromium
fetch --nohooks --no-history chromium

cd src

gn gen out/Release --args="is_debug=false"
ninja -C out/Release chromedriver
