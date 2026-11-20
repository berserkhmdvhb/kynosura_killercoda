# Reset and clean up

`shelf reset lab-m07-shelf-pod` deletes the namespace, which removes the Pod, and puts the starting file back, so `shelf verify` fails afterwards. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m07-shelf-pod
shelf down
```
