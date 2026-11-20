# Count the hops and find the veth

Trace the path from `net-a` to `net-b`, and write the number of hops. Then read the routes of the node that runs `net-a`, `reconcile-worker`, and find the line for `net-a`'s address. It ends with the name of the veth that connects `net-a` to its node. These two checks have no value that the cluster can compute: the lab cannot read a node's links or run `traceroute`. They check the form of your answer instead: the number of hops, and a name that is `veth` and eight hexadecimal characters.

```bash
kubectl exec net-a --namespace shelf -- traceroute -n <the address of net-b>
docker exec reconcile-worker ip route
```

Click **Check**. It passes when `hop-count`, `veth-of-pod-a` pass.

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
