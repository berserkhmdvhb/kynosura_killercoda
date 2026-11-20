# Reset and clean up

`shelf reset lab-m11-shelf-worker` deletes the namespace, which removes the database, the api, the CronJob and the Jobs, and puts the starting files back, so `shelf verify` fails afterwards. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m11-shelf-worker
shelf down
```
