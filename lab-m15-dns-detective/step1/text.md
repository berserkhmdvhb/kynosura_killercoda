# Prepare

The lab cluster must be running (`shelf up`). The setup creates the namespaces `shelf` and `reports`, the api and a probe Pod in `shelf`, and three objects that each have a mistake. It copies their files into a folder named `dns-detective` in your working directory. Don't edit the copies under `labs/`, because `shelf reset` restores the originals from there. Start with what exists.

```bash
shelf setup lab-m15-dns-detective
kubectl get pods --namespace shelf
kubectl get pods --namespace reports
kubectl get services --namespace shelf
kubectl exec shelf-probe --namespace shelf -- wget -qO- -T 3 http://shelf-api:8081/healthz
```
The last command fails: the api has no Service with that name yet.

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
