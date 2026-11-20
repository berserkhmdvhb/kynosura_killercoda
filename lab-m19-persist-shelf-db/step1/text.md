# Prepare

Start the cluster and run the setup. It creates the namespace `shelf` and a Secret named `shelf-db` with a fake password, and copies `shelf-db.yaml` into a folder named `persist-lab` in your working directory. Don't edit the copy under `labs/`, because `shelf reset` restores the original from there. Nothing runs yet.

```bash
shelf up storage
shelf setup lab-m19-persist-shelf-db
kubectl get storageclass
kubectl get pods --namespace shelf
```
The list of classes shows `csi-hostpath-sc`, the class that your claim uses.

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
