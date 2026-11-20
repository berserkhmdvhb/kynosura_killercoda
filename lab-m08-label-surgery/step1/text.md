# Prepare

The lab cluster must be running (`shelf up`). The setup creates the namespace `shelf` with the Deployment `shelf-web` (2 replicas, labelled `app: shelf-web` only), and the ReplicaSet `shelf-api` with its two Pods `shelf-api-a` and `shelf-api-b`. It copies `shelf-web.yaml` into a folder named `label-surgery` in your working directory. Don't edit the copy under `labs/`, because `shelf reset` restores the original from there.

```bash
shelf setup lab-m08-label-surgery
kubectl get pods --namespace shelf --show-labels
kubectl get replicaset --namespace shelf
```

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
