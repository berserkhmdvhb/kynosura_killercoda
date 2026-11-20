# Reset and clean up

`shelf reset lab-m10-probes` deletes the namespace, which removes both Deployments, and puts the starting files back, so `shelf verify` fails afterwards. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m10-probes
shelf down
```
