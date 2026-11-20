# Prepare

Start the cluster and run the setup. It creates the namespace `shelf` and a Secret named `shelf-db` with the fake demo password, and copies three files into a folder named `db-lab` in your working directory. Don't edit the copies under `labs/`, because `shelf reset` restores the originals from there. Nothing runs yet.

```bash
shelf up default
shelf setup lab-m20-shelf-db-statefulset
kubectl get pods --namespace shelf
```

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
