#!/bin/bash
SERVICEMIX=apache-servicemix-4.4.1-fuse-06-03

cd /usr/local
read -p "Press enter to redeploy ServiceMix (CTRL-C to abort)  "
rm -rf $SERVICEMIX
tar xvf $SERVICEMIX.configured.tar.gz -z

echo
echo "---KAR Pagager Upgrade--"
echo "la | grep \"(\.kar)\""
echo "(Uninstall the returned bundle number)"
echo "install -s mvn:org.apache.karaf.deployer/org.apache.karaf.deployer.kar/2.2.7"
echo
echo "---Core install---"
echo "features:addUrl file:$ELM_DEV/release/core_packager/src/main/resources/core-dependencies.xml"
echo "features:addUrl file:$ELM_DEV/release/dev_packager/src/main/resources/dev-dependencies.xml"
echo "features:install elm-dependencies"
echo "features:install elm-dev-install"
echo
echo "---Loblaw install---"
echo "features:addUrl file:$ELM_DEV/release/core_packager/src/main/resources/core-dependencies.xml"
echo "features:addUrl file:$ELM_DEV/release/dev_packager/src/main/resources/dev-dependencies.xml"
echo "features:addUrl file:$CLIENT_DEV/release/loblaw_packager/src/main/resources/loblaw-dependencies.xml"
echo "features:install elm-dependencies"
echo "features:install elm-core-install"
echo "(Uninstall the core customization helper)"
echo "features:install elm-loblaw"
echo

cd /usr/local/servicemix/bin
./servicemix

exit 0
