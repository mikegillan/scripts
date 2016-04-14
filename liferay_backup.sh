#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
LIFERAY_HOME=/opt/liferay
LIFERAY_INSTANCE=liferay-portal-6.2-ce-ga4
TODAY=$(date '+%F')

echo "Make sure Tomcat is shutdown before backing up Liferay or you will be left with locks that have to be manually deleted. Execute ./shutdown.sh in the Tomcat /bin folder."

#backup the DB
echo "Backing up the Database..."
/usr/bin/pg_dump --host localhost --port 5432 --username "postgres" --format custom --blobs --file "$LIFERAY_HOME/$LIFERAY_INSTANCE/${TODAY}_dnd_database.backup" dnd

echo "Backing up the Liferay filesystem, including the DB backup (this takes a few minutes)"
cd $LIFERAY_HOME
tar cf - $LIFERAY_INSTANCE | gzip > $DIR/${TODAY}_liferay.tgz

#remove the DB backup
rm $LIFERAY_HOME/$LIFERAY_INSTANCE/${TODAY}_dnd_database.backup
