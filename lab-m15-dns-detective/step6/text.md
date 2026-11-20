# Reset and clean up

`shelf reset lab-m15-dns-detective` deletes both namespaces, which removes the api, the clients and the Service, and puts the starting files back, so `shelf verify` fails afterwards. Remove the cluster with `shelf down` when you are done.

```bash
shelf reset lab-m15-dns-detective
shelf down
```
