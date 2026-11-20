# Wait for a Ready node

The check passes when at least one node is Ready (its condition of type Ready is `True`). Run `kubectl get nodes` until every row says Ready. A fresh cluster can take a minute.

```bash
kubectl get nodes
```

Click **Check**. It passes when `node-ready` passes.

## Stuck?

Run `shelf hint lab-m00-hello-cluster 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

Run `shelf up`, then `kubectl get nodes`. A node that says Ready is working.

</details>

<details><summary>Hint 2</summary>

If `shelf up` fails, check that Docker is running (`docker version` shows a Server section), then run it again.

</details>
