# Verify

Run the checks. A passing run prints one `PASS` line for each of the 9 checks, and it can take up to a minute while the Pods settle.

```bash
shelf verify lab-m10-probes
```
A failing check prints a `FAIL` line, the reason, and a hint. `shelf hint lab-m10-probes 1` shows the first hint, and there are four.

Click **Check**. It passes when every check of the lab passes.

## Stuck?

Run `shelf hint lab-m10-probes 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

The setup put `shelf-api.yaml` and `shelf-api-cascade.yaml` in the folder `shelf-probes` and applied both. Look at the Pods first: `kubectl get pods --namespace shelf`. The `shelf-api` Pods say `1/1` within a second, although the api does not listen for 20 seconds, because with no probe a running container counts as ready. The `shelf-api-cascade` Pods have a `RESTARTS` column that keeps growing.

</details>

<details><summary>Hint 2</summary>

Edit `shelf-probes/shelf-api.yaml` and add three probes to the `api` container, all of type `httpGet` on the port `http`. The startup probe asks `/healthz` and is the only one that runs during the slow start: give it a short `periodSeconds` such as 2 and a `failureThreshold` that makes `periodSeconds` times `failureThreshold` longer than 20 seconds, such as 15. The readiness probe asks `/readyz`. The liveness probe asks `/healthz`. Then run `kubectl apply --filename shelf-probes/shelf-api.yaml` and `kubectl rollout status deployment/shelf-api --namespace shelf`.

</details>

<details><summary>Hint 3</summary>

Read the events of a `shelf-api-cascade` Pod with `kubectl describe pod`: the liveness probe fails with `HTTP probe failed with statuscode: 503`. The probe asks `/readyz`, and that endpoint answers 503 while the database `shelf-db` is missing. A restart can't bring a database back, so the restarts are a cascade: all three replicas fail together and keep failing. In `shelf-probes/shelf-api-cascade.yaml`, change the path of the liveness probe to `/healthz` and leave the readiness probe on `/readyz`.

</details>

<details><summary>Hint 4</summary>

After you apply the fixed `shelf-api-cascade.yaml`, the new Pods show `0/1` and `RESTARTS` 0, and `kubectl rollout status` never ends. That is the right result: readiness reports that the database is missing and keeps the Pods out of traffic, and liveness leaves them alone. If a check still fails on the restart count, an old Pod may still be there: run `kubectl get pods --namespace shelf` and wait until every `shelf-api-cascade` Pod is new.

</details>
