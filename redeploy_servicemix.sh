#!/bin/bash

cd /usr/local
read -p "Press enter to redeploy ServiceMix (CTRL-C to abort)  "
rm -rf apache-servicemix-4.4.1-fuse-03-06
tar xvf apache-servicemix-4.4.1-fuse-03-06.configured.tar.gz -z

echo
echo "features:addUrl file:/n8id/elm/branches/3196/release/core_packager/src/main/resources/core-dependencies.xml"
echo "features:addUrl file:/n8id/elm/branches/3196/release/dev_packager/src/main/resources/dev-dependencies.xml"
echo "features:install elm-core-install"
echo "features:install elm-dev-install"
echo

cd /usr/local/servicemix/bin
./servicemix

exit 0
