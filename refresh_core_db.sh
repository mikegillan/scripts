#!/bin/bash
# This script calls compileELMDB and then exec the file it generates to the elm database
# Change the workspace path to match your environment. 
#(The reason this script is not taking an argument for workspace because its designed to be easy to execute)

#IMPORTANT: change this variable to match your environment workspace path
WORKSPACE_PATH=$ELM_ROOT/$ELM_BRANCH

FILE_NAME="dbcreate_elm_`date +"%Y%m%d"`.sql"

echo "Removing old database creation scripts"
rm -f /tmp/dbcreate_*

echo "Compiling new database creation script in $WORKSPACE_PATH as /tmp/$FILE_NAME"
$WORKSPACE_PATH/libraries/scripts/src/main/resources/compileELMDB $WORKSPACE_PATH /tmp/$FILE_NAME $1
psql -U postgres -h localhost -d elm -f /tmp/$FILE_NAME -v ON_ERROR_STOP=1

read -p "Delete scheduled processes (y/n)? "
[ "$REPLY" != "y" ] || psql -U postgres -h localhost -d elm -c 'DELETE FROM process.process_catalog WHERE schedule IS NOT NULL'

exit 0
