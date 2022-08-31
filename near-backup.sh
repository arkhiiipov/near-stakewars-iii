#!/bin/bash

DATE=$(date +%Y-%m-%d)
DATADIR=/root/.near/data
BACKUPDIR=/mnt/backups/near_${DATE}
BACKUPNAME=near-db-backup

mkdir -p ${BACKUPDIR}

sudo systemctl stop neard

wait

echo "NEAR node was stopped" | ts
 STATUS=()

if [ -d "$BACKUPDIR" ]; then
    echo "Backup started" | ts
    cd /root/.near/data && tar -cvf near-db-backup.tar.gz *
    cp -rf near-db-backup.tar.gz ${BACKUPDIR}
    rm -rf near-db-backup.tar.gz
    sha1sum ${BACKUPDIR}/${BACKUPNAME}.tar.gz | awk '{print $1}' > ${BACKUPDIR}/${BACKUPNAME}.hash
    find /mnt/backups/ -mtime +3 -exec rm -rf {} \;
    echo "Backup completed" | ts
else
    echo ${BACKUPDIR} is not created. Check your permissions.
    exit 0
fi

#sudo systemctl start neard

echo "NEAR node was started" | ts

echo ${STATUS[*]}

