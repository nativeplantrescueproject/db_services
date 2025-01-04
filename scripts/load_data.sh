#!/usr/bin/env bash

# Backs up just the data in the provided tables
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BACKUP_DIR="$(dirname ${SCRIPT_DIR})/backups"
if [ -d "${BACKUP_DIR}" ]; then
  echo "${BACKUP_DIR} does exist."
else
  exit 1
fi
# TODO: Pick last 5 files
#   then order from most recent
#   then have user pick 1-5 or 'c' to cancel
#   if file ends in .gz, unzip, otherwise don't
#gzip -d <dumpfile.sql.gz> | docker exec -i pgdbprod psql -U postgres