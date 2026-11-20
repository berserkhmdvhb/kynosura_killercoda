# Reset and clean up

`shelf reset lab-m12-node-agent-and-identity` deletes the namespace, which removes the DaemonSet, the StatefulSet, the Service and their Pods, and puts the taint and the starting files back, so `shelf verify` fails afterwards. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m12-node-agent-and-identity
shelf down
```
