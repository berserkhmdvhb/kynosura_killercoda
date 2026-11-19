# Check the kind cluster

Run these commands:

```bash
kubectl get nodes
kubectl version
cat /tmp/kind-setup-seconds
```

The node `smoke-control-plane` should be `Ready`, and the server version should be `v1.37.0`.

Click **Check**. It passes if the node is Ready and the server runs v1.37.0.

If the check fails, run `tail -n 40 /tmp/kind-setup.log` and send that output and `cat /tmp/kind-setup-seconds` back to the course author.
