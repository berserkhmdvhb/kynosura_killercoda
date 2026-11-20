# Reset and clean up

`shelf reset lab-m08-label-surgery` deletes both namespaces, which removes everything that you made, and puts the starting file back, so `shelf verify` fails afterwards. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m08-label-surgery
shelf down
```
