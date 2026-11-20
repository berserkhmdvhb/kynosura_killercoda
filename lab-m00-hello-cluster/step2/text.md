# Find the context

The check passes when kubectl lists a context named `kind-reconcile`.

```bash
kubectl config get-contexts --output name
```
If the list does not include `kind-reconcile`, `shelf up` has not finished or failed. Read its last message.

Click **Check**. It passes when `context-exists` passes.

## Stuck?

Run `shelf hint lab-m00-hello-cluster 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

Run `shelf up`, then `kubectl get nodes`. A node that says Ready is working.

</details>

<details><summary>Hint 2</summary>

If `shelf up` fails, check that Docker is running (`docker version` shows a Server section), then run it again.

</details>
