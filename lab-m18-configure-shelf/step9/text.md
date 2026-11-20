# Reset and clean up

`shelf reset lab-m18-configure-shelf` deletes the namespace, which removes everything you applied, and puts the starting file back, so `shelf verify` fails afterwards. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m18-configure-shelf
shelf down
```
