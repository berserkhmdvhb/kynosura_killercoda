# Read both logs

The check reads the logs of every container of the Pod. The line `"msg":"shelf started"` must appear twice: once from the api, and once from the sidecar's copy.

```bash
kubectl logs shelf-api --namespace shelf --container api
kubectl logs shelf-api --namespace shelf --all-containers
```

Click **Check**. It passes when `log-shipped` passes.

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
