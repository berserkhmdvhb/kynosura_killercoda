# Default deny

`netpol-lab/policies.yaml` holds the two default-deny policies, and its comments list what to add. Apply it, and watch the Shelf break: the lookups fail, and the api stops being ready. Select Pods by their `app.kubernetes.io/component` label (web, api, db, cache): the test Pods wear the same labels, so your policies treat them like the Shelf Pods.

```bash
kubectl apply --filename netpol-lab/policies.yaml
kubectl get pods --namespace shelf
kubectl exec probe-web --namespace shelf -- nslookup -timeout=2 kubernetes.default.svc.cluster.local. 10.96.0.10
```
