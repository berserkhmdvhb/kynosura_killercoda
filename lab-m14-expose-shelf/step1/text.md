# Prepare

The lab cluster must be running (`shelf up`). The setup creates the namespace `shelf`, the three Deployments, the probe Pod `shelf-probe` and the api Service, and copies three files into a folder named `expose-shelf` in your working directory. Don't edit the copies under `labs/`, because `shelf reset` restores the originals from there. Look at the Pods first. The api Pods run but are not ready: they wait for a database that has no Service, and so no name yet.

```bash
shelf setup lab-m14-expose-shelf
kubectl get pods --namespace shelf
kubectl get services --namespace shelf
kubectl get endpointslices --namespace shelf
```

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
