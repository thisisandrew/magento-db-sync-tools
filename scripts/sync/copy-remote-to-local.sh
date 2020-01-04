#!/bin/bash

set -e

while [[ $REMOTE_HOST == '' ]] # While string is different or empty...
do
    read -p "Enter remote host: " REMOTE_HOST # Ask the user to enter a string
done

while [[ $LOCAL_DIR == '' ]] # While string is different or empty...
do
    read -p "Enter local directory (relative to ~/_db/):" LOCAL_DIR # Ask the user to enter a string
done

while [[ $LATEST == '' ]] # While string is different or empty...
do
    read -p "Get latest Y/n? [Y]:" LATEST # Ask the user to enter a string
    LATEST=${LATEST:-Y}
done

if [[ $LATEST == 'n' ]] || [[ $LATEST == 'N' ]]; then
	while [[ $DB_FILE == '' ]] # While string is different or empty...
	do
    	read -p "Specify remote db file [magento.sql.gz]:" DB_FILE # Ask the user to enter a string
    	DB_FILE=${DB_FILE:-Y}
	done	
fi

##LATEST assumes that a db will be present at /root/_db/latest/*.sql.gz OR *.sql
if [[ $LATEST == 'Y' ]] || [[ $LATEST == 'y' ]]; then
	scp root@$REMOTE_HOST:~/_db/latest/\*.sql.gz ~/_db/pro/$LOCAL_DIR/latest/
	if [ $? -eq 0 ] then
		echo "Done - Copied to ~/_db/pro/$LOCAL_DIR/latest/"
	fi
else
	scp root@$REMOTE_HOST:~/_db/$DB_FILE ~/_db/pro/$LOCAL_DIR/archive
	echo "Done - Copied to ~/_db/pro/$LOCAL_DIR/archive"
fi

set +e