#!/bin/bash

cd /usr/local
read -p "Press enter to redeploy ServiceMix (CTRL-C to abort)  "
rm -rf apache-servicemix-4.4.1-fuse-03-06
tar xvf apache-servicemix-4.4.1-fuse-03-06.configured.tar.gz -z

cd /usr/local/servicemix/bin
./servicemix

