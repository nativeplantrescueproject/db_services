#!/usr/bin/env bash

# Backs up just the data in the provided tables
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BACKUP_DIR="$(dirname ${SCRIPT_DIR})/backups"
if [ -d "${BACKUP_DIR}" ]; then
  echo "${BACKUP_DIR} does exist."
else
  echo "${BACKUP_DIR} does not exist."
  exit 1
fi
#echo "${BACKUP_DIR}/dump_`date +%Y%m%d_%H%M%S`.sql.gz"
docker exec -t pgdbprod pg_dump --column-inserts --data-only nprp -U postgres | gzip > "${BACKUP_DIR}/app/dump_`date +%Y%m%d_%H%M%S`.sql.gz"