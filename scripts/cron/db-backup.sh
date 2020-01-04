#!/bin/sh

PATH_TO_MAGENTO=$1
DB_NAME=$2
DATETIME=$(date +'%F_%T')

#Clear latest
echo "Cleaning previous latest"
rm -f /root/_db/latest/*.sql.gz
echo "Done cleaning previous latest"

#Make directories if they don't exist
echo "Checking directories"
mkdir -p /root/_db/latest
mkdir -p /root/_db/sanitized
mkdir -p /root/_db/archive
echo "Done checking directories"

# Mysql dumps from main databases with gzip
echo "Dump database latest"
mysqldump -uroot $DB_NAME | gzip > /root/_db/latest/$DB_NAME-$DATETIME.sql.gz
echo "Done dump database latest"

# Mysql dump sanitized from main database with gz
#mysqldump -uroot  DB_NAME | gzip > /root/_db/sanitized/DB_NAME-sani-$DATETIME.sql.gz
echo "Dump sanitized database"
magerun db:dump --root-dir=$PATH_TO_MAGENTO --force --compression="gzip" --add-routines --exclude="core_config_data" --strip="*_tmp_indexer *grid_archive @customers @dataflowtemp @log @sales @sessions admin_user api_user " /root/_db/sanitized/$DB_NAME-$DATETIME
echo "Done dump sanitized database"

#Keep a copy of the latest in archive
echo "Copy latest to archive"
cp /root/_db/latest/$DB_NAME-$DATETIME.sql.gz /root/_db/archive/DB_NAME-$DATETIME.sql.gz
echo "Done copy latest to archive"

echo "DONE"