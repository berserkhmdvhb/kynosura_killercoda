# Reset and clean up

`shelf reset lab-m14-expose-shelf` deletes the namespace, which removes the Deployments, the probe Pod and every Service, and puts the starting files back, so `shelf verify` fails afterwards. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m14-expose-shelf
shelf down
```
