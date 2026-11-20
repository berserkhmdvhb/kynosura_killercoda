# A short name from another namespace

The client in `reports` reads its target from the variable `API_URL`. Read the variable and its search list, and ask for the name from inside the Pod: the short name looks for a Service in `reports`. Fix `dns-detective/reports-client.yaml` so that the name includes the namespace of the Service, then apply it.

```bash
kubectl exec --namespace reports deployment/reports-client -- cat /etc/resolv.conf
kubectl exec --namespace reports deployment/reports-client -- sh -c 'wget -qO- -T 3 "$API_URL/healthz"'
kubectl apply --filename dns-detective/reports-client.yaml
kubectl rollout status deployment/reports-client --namespace reports
kubectl exec --namespace reports deployment/reports-client -- sh -c 'wget -qO- -T 3 "$API_URL/healthz"'
```
The `resolv.conf` of your Pod may list more search domains than the lesson's captures, taken from your machine. Look at the first `search` entry, which is the Pod's own namespace.

Click **Check**. It passes when `reports-url`, `reports-lookup` pass.

## Stuck?

Run `shelf hint lab-m15-dns-detective 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

The setup left the api (`shelf-api`, one Pod), a probe Pod, and three objects with a DNS mistake each. Start with the names: `kubectl get services --namespace shelf` lists the Service for the api. Compare its name with the name in the clients' URLs, `shelf-api`. The three mistakes are independent, except that the clients can't reach the api until the Service has the right name.

</details>

<details><summary>Hint 2</summary>

The Service's name is `shelf-ap`, so no lookup for `shelf-api` finds it. A name can't be changed. Fix `name:` in `dns-detective/shelf-api-service.yaml`, delete the old Service with `kubectl delete service shelf-ap --namespace shelf`, and apply the file. Then `kubectl exec shelf-probe --namespace shelf -- wget -qO- -T 3 http://shelf-api:8081/healthz` should print `{"status":"ok"}`.

</details>

<details><summary>Hint 3</summary>

The client in `reports` has `API_URL` set to `http://shelf-api:8081`. Its search list starts with `reports.svc.cluster.local`, so the short name looks for a Service in `reports`, and finds none: `NXDOMAIN`. Name the namespace of the Service in `dns-detective/reports-client.yaml` (`shelf-api.shelf`), then apply the file. The Deployment replaces its Pod, so wait for the rollout.

</details>

<details><summary>Hint 4</summary>

`kubectl get pod shelf-batch --namespace shelf --output jsonpath='{.spec.dnsPolicy}'` prints `Default`: the Pod asks the resolver of its node, which has never heard of `shelf-api`. Set `dnsPolicy: ClusterFirst` in `dns-detective/shelf-batch.yaml`. The field can't be changed on a running Pod, so delete the Pod and apply the file. Then run `shelf verify lab-m15-dns-detective`.

</details>
