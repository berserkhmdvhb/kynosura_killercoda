# Prepare

The lab cluster must be running (`shelf up`). The setup creates the namespace `shelf` with two Deployments, `shelf-web` (2 replicas) and `shelf-api` (1 replica). It copies `shelf-web.yaml` and nine empty output files into a folder named `kubectl-drills` in your working directory.

```bash
shelf setup lab-m06-kubectl-drills
ls kubectl-drills
kubectl get deployments --namespace shelf
```
Write your answers into the files in `kubectl-drills`, with `>` to send a command's output into a file. Don't edit the copies under `labs/`, because `shelf reset` restores the originals from there.

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
