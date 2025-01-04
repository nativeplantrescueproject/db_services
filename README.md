# db_services
Saved config for database setup


### Cronjobs
Below are the starting cronjobs to add:
```
# Weekly backup of database at 1am Monday 
0 1 * * 1 docker exec -t db pg_dumpall -c -U postgres | gzip > backups/dump_`date +%Y%m%d_%H%M%S`.sql.gz
```

[OPTIONAL] data-only dumps
```bash
docker exec -t db pg_dump --column-inserts --data-only nprp -U postgres > backups/dump_nprp_`date +%Y%m%d_%H%M%S`.sql 
```

[OPTIONAL] Load data from backup
```bash
gzip -d <dumpfile.sql.gz> | docker exec -i db psql -U postgres
```