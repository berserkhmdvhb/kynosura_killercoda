# Find the addresses

Write the address of each Pod, the node that runs `net-b`, that node's address on the node network, and its Pod range, the Classless Inter-Domain Routing (CIDR) block that the node hands out. The cluster computes the right answer for each of these, and the check compares your value with it.

```bash
kubectl get pods --namespace shelf --output wide
kubectl get node reconcile-control-plane --output wide
kubectl get node reconcile-control-plane --output jsonpath='{.spec.podCIDR}'
```

Click **Check**. It passes when `pods-ready`, `pod-a-ip`, `pod-b-ip`, `pod-b-node`, `pod-b-node-address`, `pod-b-cidr` pass.

## Stuck?

Run `shelf hint lab-m13-trace-a-packet 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

The setup started two Pods, `net-a` on the worker and `net-b` on the control plane node, and copied a blank `answers.yaml` into `trace-a-packet/`. Start with `kubectl get pods --namespace shelf --output wide`: it gives you both Pod addresses and the node of `net-b`. Then read the node's addresses and Pod CIDR with `kubectl get node reconcile-control-plane --output yaml`.

</details>

<details><summary>Hint 2</summary>

`net-b` runs a small web server on port 8080. Its page `/cgi-bin/whoami` prints the address that the connection came from. Call it from `net-a` with `kubectl exec net-a --namespace shelf -- wget -qO- http://<the address of net-b>:8080/cgi-bin/whoami`. Compare what it prints with `net-a`'s own address.

</details>

<details><summary>Hint 3</summary>

A traceroute between the Pods shows each hop: `kubectl exec net-a --namespace shelf -- traceroute -n <the address of net-b>`. The first hop is the node's end of `net-a`'s veth pair, the second is the other node, and the last is `net-b`. Count the lines.

</details>

<details><summary>Hint 4</summary>

The veth name is on the node of `net-a`, which is `reconcile-worker`. Run `docker exec reconcile-worker ip route`. One line starts with `net-a`'s address and ends with `dev veth` and a name of eight more characters. That is the answer for `veth-of-pod-a`.

</details>
