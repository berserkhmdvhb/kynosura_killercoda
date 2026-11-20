# Reset and clean up

`shelf reset lab-m00-hello-cluster` deletes the cluster, so `shelf verify` fails afterwards. That is how you see that the checks mean something. It also cleans up, so you don't need `shelf down` after it. Start again with step 1 whenever you want the cluster back.

```bash
shelf reset lab-m00-hello-cluster
```
Now run the checks again. Both fail, because the context and the node are gone. This output was captured after the cluster was deleted.
