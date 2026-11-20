# Reset and clean up

`shelf reset lab-m09-shelf-rollout` deletes the namespace, which removes both Deployments, and puts the starting files back, so `shelf verify` fails afterwards. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m09-shelf-rollout
shelf down
```
