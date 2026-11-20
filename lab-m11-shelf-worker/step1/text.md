# Prepare

The lab cluster must be running (`shelf up`). The setup creates the namespace `shelf`, applies a database (`shelf-db`) and an api (`shelf-api`) that creates the tables and seeds the catalogue, and copies two draft files into a folder named `shelf-worker` in your working directory. Don't edit the copies under `labs/`, because `shelf reset` restores the originals from there. Wait for the api before you create any Job: the worker needs the seeded database, and a Job that starts too early fails.

```bash
shelf setup lab-m11-shelf-worker
kubectl rollout status deployment/shelf-api --namespace shelf
cat shelf-worker/report-cronjob.yaml
```

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
