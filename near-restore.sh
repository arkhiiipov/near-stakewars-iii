#!/bin/bash

DATADIR=/root/.near/data
DATE=$(date +%Y-%m-%d)
BACKUPDIR=/mnt/backups/

systemctl stop neard

rm -rf ${DATADIR}

mkdir -p ${DATADIR}

cd /root/.near/data &&  tar -xvf ${BACKUPDIR}/near_${DATE}/near-db-backup.tar.gz

systemctl start neard
