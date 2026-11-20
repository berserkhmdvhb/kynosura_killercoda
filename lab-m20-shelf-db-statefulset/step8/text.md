# Reset and clean up

`shelf reset lab-m20-shelf-db-statefulset` deletes the namespace, which removes the StatefulSet, the Jobs and both claims, and the class's reclaim policy `Delete` removes the volumes. It puts the starting files back, so `shelf verify` fails afterwards. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m20-shelf-db-statefulset
shelf down
```
