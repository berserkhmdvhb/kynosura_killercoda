# Prepare

Start the cluster and run the setup. It creates the namespace `shelf` and a Secret named `shelf-db` that holds a fake password, and it copies `shelf-api.yaml` into a folder named `config-lab` in your working directory. Don't edit the copy under `labs/`, because `shelf reset` restores the original from there. Nothing runs yet.

```bash
shelf up default
shelf setup lab-m18-configure-shelf
kubectl get secret --namespace shelf
kubectl get pods --namespace shelf
```

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
