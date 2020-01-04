# Tools to Backup and Sync back Magento Databases from Remote Hosts

## Deploy

Use `git` to get the scripts onto remote servers or local machines

`git clone https://github.com/thisisandrew/magento-db-sync-tools.git ~/.tools/magento-db-sync-tools.git`

## scripts/cron

Deploy into a crontab like (for the same user that cloned the repo)

`0 22 * * * ~/.tools/magento-db-sync-tools/scripts/cron/db-backup.sh >> /root/cron.log`

## scripts/sync

Interactive cli script to pull back db files from remote hosts

