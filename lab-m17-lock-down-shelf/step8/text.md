# Reset and clean up

`shelf reset lab-m17-lock-down-shelf` deletes both namespaces, which removes the Shelf, the test Pods and every policy, and puts the starting file back, so `shelf verify` fails afterwards. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m17-lock-down-shelf
shelf down
```
