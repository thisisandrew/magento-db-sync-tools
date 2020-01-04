# Tools to backup and sync back Magento Databses from remote hosts

## Deploy

Use `git` to get the scripts onto remote servers or local machines

`mkdir /root/.tools`
`git clone https://github.com/thisisandrew/magento-db-sync-tools.git ~/.tools/`

## scripts/cron

Deploy into a crontab like

`0 22 * * * /root/.tools/magento-db-sync-tools/scripts/cron/db-backup.sh >> /root/cron.log`

## scripts/sync

Interactive cli script to pull back db files from remote hosts

