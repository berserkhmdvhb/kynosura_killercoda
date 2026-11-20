# Start the cluster

Run `shelf up`. It creates the cluster `reconcile` from the `default` profile, and kind adds the context `kind-reconcile` to your kubeconfig. If the cluster already exists, `shelf up` says so and changes nothing.

```bash
shelf up
```

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
