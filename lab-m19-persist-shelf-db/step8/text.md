# Reset and clean up

`shelf reset lab-m19-persist-shelf-db` deletes the namespace, which removes the Deployment and the claim, and the class's reclaim policy `Delete` removes the volume. It puts the starting file back, so `shelf verify` fails afterwards. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m19-persist-shelf-db
shelf down
```
