# Roll out v2

Change the image tag of both Deployments to `v2`, in the files or with `kubectl set image`, and wait for each rollout to finish before you go on. Watch the two ReplicaSets of one Deployment trade Pods.

```bash
kubectl set image deployment/shelf-web web=localhost:5001/shelf/web:v2 --namespace shelf
kubectl set image deployment/shelf-api api=localhost:5001/shelf/api:v2 --namespace shelf
kubectl get replicaset --namespace shelf --watch
kubectl rollout status deployment/shelf-api --namespace shelf
```

Click **Check**. It passes when `web-image-is-v2` passes.

## Stuck?

Run `shelf hint lab-m09-shelf-rollout 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

The setup put `shelf-api.yaml` and `shelf-web.yaml` in the folder `shelf-rollout`. Both are complete Deployments at tag `v1`, so the first task is only to apply them: `kubectl apply --filename shelf-rollout/`. Then wait for each rollout with `kubectl rollout status`.

</details>

<details><summary>Hint 2</summary>

A rollout starts when the Pod template changes. Change `image:` from `:v1` to `:v2` in both files and apply them again, or use `kubectl set image` with the container name (`api` for the api, `web` for the web). Wait until `kubectl rollout status` says `successfully rolled out` before the next change, because each finished version becomes one revision of the history.

</details>

<details><summary>Hint 3</summary>

Change the api image to `localhost:5001/shelf/api:v3-broken` and apply it. The new Pod starts, but its `/readyz` answers 503, so it never becomes Ready. The old Pods keep serving, and `kubectl rollout status deployment/shelf-api --namespace shelf` waits and, after the 30-second progress deadline, ends with `exceeded its progress deadline`. `kubectl get replicaset --namespace shelf` shows one ReplicaSet with 3 Ready Pods and one with 1 Pod that is not Ready.

</details>

<details><summary>Hint 4</summary>

`kubectl rollout history deployment/shelf-api --namespace shelf` lists the revisions, and `kubectl rollout undo deployment/shelf-api --namespace shelf` goes back to the one before the current. The undo changes the live Deployment, not your file, so `shelf-rollout/shelf-api.yaml` still says whatever you last wrote there: do not apply an old file by mistake.

</details>
