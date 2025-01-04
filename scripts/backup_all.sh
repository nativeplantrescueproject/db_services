#!/usr/bin/env bash

# Backs up entire database
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BACKUP_DIR="$(dirname ${SCRIPT_DIR})/backups"
if [ -d "${BACKUP_DIR}" ]; then
  echo "${BACKUP_DIR} does exist."
else
  exit 1
fi
#echo "${BACKUP_DIR}/dump_`date +%Y%m%d_%H%M%S`.sql.gz"
docker exec -t pgdbprod pg_dumpall -c -U postgres | gzip > "${BACKUP_DIR}/dump_`date +%Y%m%d_%H%M%S`.sql.gz"