# Prepare

The lab cluster must be running (`shelf up`). The setup creates the namespace `shelf` and the Deployment `shelf-web` with 2 replicas, and copies two files into a folder named `observe-reconciliation` in your working directory: `shelf-web.yaml`, the manifest that matches the Deployment, and `answers.yaml`, where you write your answer later.

```bash
shelf setup lab-m04-observe-reconciliation
ls observe-reconciliation
kubectl get pods --namespace shelf
```
Edit the files in `observe-reconciliation`. Don't edit the copies under `labs/`, because `shelf reset` restores the originals from there.

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
