#!/bin/bash
rm -rf test
mkdir test
cd test
git init 
mkdir -p .git/info
git sparse-checkout init
#git sparse-checkout set "chrome/common/extensions/api/"

echo "chrome/common/extensions/api/" > .git/info/sparse-checkout
echo "!chrome/common/extensions/api/commands/" >> .git/info/sparse-checkout    
echo "!chrome/common/extensions/api/devtools/" >> .git/info/sparse-checkout
echo "chrome/common/extensions/permissions/" >> .git/info/sparse-checkout

git config remote.origin.promisor true

git config remote.origin.partialclonefilter blob:none

git remote add origin https://github.com/chromium/chromium.git
git pull --depth 1 origin 2d4a97f1ed2dd875557849b4281c599a7ffaba03
#git pull --depth 1 origin master
.
bitbake-layers create-layer meta-test
bitbake-layers add-layer meta-test
mkdir -p meta-test/recipes-h1/h1
recipetool create -V 1.0 https://github.com/BlueUnicorn7777/Jaya1.git -B B1 -o ./meta-test/recipes-h1/h1/
