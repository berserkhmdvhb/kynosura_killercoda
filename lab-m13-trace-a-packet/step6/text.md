# Reset and clean up

`shelf reset lab-m13-trace-a-packet` puts the blank answer file back, so `shelf verify` fails afterwards. The Pods stay: reset leaves the cluster as the setup made it. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m13-trace-a-packet
shelf down
```
