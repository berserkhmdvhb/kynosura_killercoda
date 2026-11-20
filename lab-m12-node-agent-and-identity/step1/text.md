# Prepare

Start the cluster with `shelf up multinode`. The setup creates the namespace `shelf`, puts the taint `dedicated=db:NoSchedule` on the worker `reconcile-worker3`, and copies two draft files into a folder named `node-and-db` in your working directory. Don't edit the copies under `labs/`, because `shelf reset` restores the originals from there.

```bash
shelf up multinode
shelf setup lab-m12-node-agent-and-identity
kubectl get nodes
cat node-and-db/node-agent.yaml
```

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
