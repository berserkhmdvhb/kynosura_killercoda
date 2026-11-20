# Reset and clean up

`shelf reset lab-m04-observe-reconciliation` deletes the namespace `shelf`, which removes the Deployment and everything it created, and puts the two files back. `shelf verify` fails afterwards, so you can see that the checks mean something. Run `shelf setup` again to start over, or remove the cluster if you are done for now.

```bash
shelf reset lab-m04-observe-reconciliation
shelf down
```
