# The loss

Drop the database. This is the disaster that the claim alone cannot undo. The marker row is gone with it.

```bash
kubectl exec shelf-db-0 --namespace shelf -- psql --username shelf --dbname postgres --command "drop database shelf with (force)"
```
