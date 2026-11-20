# A marker row

Write a row that the backup must carry. The table has the time of the write, and the last check uses it. Write exactly this row, because the check looks for its text.

```bash
kubectl exec shelf-db-0 --namespace shelf -- psql --username shelf --dbname shelf --command "create table marker (note text, written_at timestamptz default now()); insert into marker (note) values ('before the backup');"
```
