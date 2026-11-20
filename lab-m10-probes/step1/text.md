# Prepare

The lab cluster must be running (`shelf up`). The setup creates the namespace `shelf`, applies two Deployments, and copies their files into a folder named `shelf-probes` in your working directory. `shelf-api` has 2 replicas and no probes. `shelf-api-cascade` has 3 replicas and a liveness probe that depends on a database that is not there. Don't edit the copies under `labs/`, because `shelf reset` restores the originals from there.

```bash
shelf setup lab-m10-probes
kubectl get pods --namespace shelf
cat shelf-probes/shelf-api.yaml
```

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
