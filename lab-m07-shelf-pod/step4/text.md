# Apply and wait

Apply the file, and watch the Pod. Native sidecars appear in `STATUS` as init containers, and `READY` counts them with the regular container, so the Pod should end as `2/2 Running`. You cannot add containers to a running Pod: if you applied the starting file first, delete that Pod before you apply the new one.

```bash
kubectl apply --filename shelf-pod/shelf-api.yaml
kubectl get pod shelf-api --namespace shelf --watch
```

This Check also covers step 3, "Add the sidecar": do that task first.

Click **Check**. It passes when `pod-ready`, `runs-the-api`, `native-sidecar` pass.

## Stuck?

Run `shelf hint lab-m07-shelf-pod 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

Start from the file that `shelf setup` copied: `shelf-pod/shelf-api.yaml`. The Pod needs a place that both containers can write to and read from: a volume of type `emptyDir`, mounted into both containers at the same path.

</details>

<details><summary>Hint 2</summary>

The api writes a copy of its log to a file when the variable `SHELF_LOG_FILE` holds a path, for example `/var/log/shelf/shelf.log`. The Shelf worker image has a command that follows a file and copies each line to its own stdout: `logtail --file <path>`. Its entrypoint is already the worker, so `args: ["logtail", "--file", "..."]` is enough.

</details>

<details><summary>Hint 3</summary>

Put the sidecar under `initContainers` and give it `restartPolicy: Always`. If you applied the starting file first, delete the Pod before you apply the new one: Kubernetes does not let you add containers to a running Pod. `kubectl delete --filename shelf-pod/shelf-api.yaml` removes it.

</details>
