# Prepare

The lab cluster must be running (`shelf up`). The setup creates the namespace `shelf` and two Pods, `net-a` and `net-b`, and copies a blank `answers.yaml` into a folder named `trace-a-packet` in your working directory. The default profile has one worker, so `net-a` is pinned to it with a `nodeSelector`, and `net-b` is pinned to the control plane node with a `nodeSelector` and a toleration for the control plane taint. That puts the Pods on two different nodes, so the packet has to cross the node network. Don't edit the files under `labs/`, because `shelf reset` restores the blank original from there.

```bash
shelf setup lab-m13-trace-a-packet
kubectl get pods --namespace shelf --output wide
cat trace-a-packet/answers.yaml
```

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
