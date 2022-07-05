#!/bin/bash

PN=${1}
PV=${2}


bitbake-layers remove-layer meta-${PN}
mv ../poky/meta-${PN} ../poky/meta-${PN}.bak
set -e 
bitbake-layers create-layer  ../poky/meta-${PN}
bitbake-layers add-layer ../poky/meta-${PN}
mv ../poky/meta-${PN}/recipes-example ../poky/meta-${PN}/recipes-${PN}
mv ../poky/meta-${PN}/recipes-${PN}/example ../poky/meta-${PN}/recipes-${PN}/${PN}
rm ../poky/meta-${PN}/recipes-${PN}/${PN}/example_0.1.bb
mkdir ../poky/meta-${PN}/recipes-${PN}/${PN}/${PN}-${PV}
cp ../poky/scripts/appliedrecipe ../poky/meta-${PN}/recipes-${PN}/${PN}/${PN}_${PV}.bb

cd ../poky/meta-${PN}/recipes-${PN}/${PN}/${PN}-${PV}
git init
git config core.sparsecheckout true
git config uploadpack.allowfilter true
git config uploadpack.blob:none.allow true
git config uploadpack.tree:0.allow true

#echo Dir1/ >> .git/info/sparse-checkout
echo Dir2/ >> .git/info/sparse-checkout
git remote add origin git@github.com:BlueUnicorn7777/Jaya1.git





