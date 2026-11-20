# Prepare

Start the cluster with the profile and run the setup (the check `probes-ready` waits for the test Pods). It creates the namespaces `shelf` and `outside`, the Shelf in `shelf` (web, api, db and cache), four test Pods in `shelf` that wear the component labels (`probe-web`, `probe-api`, `probe-db` and `probe-cache`), and a visitor, `client`, in `outside`. It copies a starting file into a folder named `netpol-lab` in your working directory. Don't edit the copy under `labs/`, because `shelf reset` restores the original from there. Before you write anything, see that the network is flat.

```bash
shelf up netpol
shelf setup lab-m17-lock-down-shelf
kubectl get pods --namespace shelf
kubectl get networkpolicy --namespace shelf
kubectl exec client --namespace outside -- sh -c 'nc -z -w 2 db.shelf.svc.cluster.local. 5432 && echo "client to db: allowed" || echo "client to db: denied"'
```
The last command says `allowed`: a Pod of another namespace connects to the database.

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
