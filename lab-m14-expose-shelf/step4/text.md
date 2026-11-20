# Follow a request through the chain

The probe is a `busybox` Pod, because the Shelf images have no shell. The names end in a dot so that no search domain of your machine is used. The last request goes through the web Service to the web server, which asks the api through its Service, and the api asks the database through its Service.

```bash
kubectl exec shelf-probe --namespace shelf -- nc -zw 3 shelf-db.shelf.svc.cluster.local. 5432
kubectl exec shelf-probe --namespace shelf -- wget -qO- -T 3 http://shelf-web.shelf.svc.cluster.local.:80/healthz
kubectl exec shelf-probe --namespace shelf -- wget -qO- -T 5 http://shelf-web.shelf.svc.cluster.local.:80/api/books
```

Click **Check**. It passes when `db-reachable`, `api-reachable`, `web-reachable`, `chain-works` pass.

## Stuck?

Run `shelf hint lab-m14-expose-shelf 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

The setup left three Deployments (`shelf-db`, `shelf-api`, `shelf-web`), a probe Pod, the api Service with two mistakes, and three files in `expose-shelf/`. Start with `kubectl get pods --namespace shelf`: the api Pods run but are not ready, because they wait for a database that has no Service and so no name. The chain is web, then api, then db, and each link is a Service name.

</details>

<details><summary>Hint 2</summary>

Complete `expose-shelf/shelf-db-service.yaml` and `expose-shelf/shelf-web-service.yaml`. The database Service needs `port: 5432`. The web Service needs `port: 80` and `targetPort: 8080`: clients use 80, and the web server listens on 8080. Apply them with `kubectl apply --filename expose-shelf/shelf-db-service.yaml`. A file with an empty `ports` list is refused: read the message.

</details>

<details><summary>Hint 3</summary>

The api Service is broken in two places, and the second shows only after the first is fixed. First, `kubectl get endpointslices --namespace shelf` shows no endpoints for `shelf-api`: compare its selector, in `kubectl get service shelf-api --namespace shelf --output wide`, with the labels in `kubectl get pods --namespace shelf --show-labels`. Fix the selector and apply the file. Then send a request from the probe Pod: it is refused. Compare the `PORTS` of the EndpointSlice with the port in the startup line of `kubectl logs deployment/shelf-api --namespace shelf`.

</details>

<details><summary>Hint 4</summary>

Test each link from the probe Pod, with fully qualified names that end in a dot: `kubectl exec shelf-probe --namespace shelf -- wget -qO- -T 3 http://shelf-api.shelf.svc.cluster.local.:8081/healthz`, and the same for `shelf-web` on port 80. The whole chain is `http://shelf-web.shelf.svc.cluster.local.:80/api/books`: the web server asks the api, and the api asks the database. If the books come back, `shelf verify lab-m14-expose-shelf` should pass.

</details>
