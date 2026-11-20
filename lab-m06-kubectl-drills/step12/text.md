# Reset and clean up

`shelf reset lab-m06-kubectl-drills` deletes the namespace, which removes both Deployments, and puts the empty output files back, so `shelf verify` fails afterwards. If you created `shelf-scratch` in step 8 with a real apply, delete it with `kubectl delete namespace shelf-scratch`. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m06-kubectl-drills
shelf down
```
