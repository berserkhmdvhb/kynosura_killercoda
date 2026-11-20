# Find the kubelet

Look for a kubelet Pod, and read the kubelet's version in the node list. Under `kubelet`, write `"no"` for `is-a-pod`, and the version of the kubelet for `version`.

```bash
kubectl get pods --all-namespaces
kubectl get nodes
```

Click **Check**. It passes when `kubelet-is-not-a-pod`, `kubelet-version` pass.

## Stuck?

Run `shelf hint lab-m05-component-hunt 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

Start with `kubectl get pods --namespace kube-system --output wide`. The control plane components are Pods there, and the NODE column says where each one runs. kube-proxy and CoreDNS are in the same list.

</details>

<details><summary>Hint 2</summary>

To tell the three workload kinds apart, read who owns a Pod: `kubectl get pods --namespace kube-system --output custom-columns=NAME:.metadata.name,OWNER:.metadata.ownerReferences[0].kind`. A Pod owned by a Node is a static Pod. A Pod owned by a DaemonSet has one copy per node. A Pod owned by a ReplicaSet belongs to a Deployment, because a Deployment owns the ReplicaSet.

</details>

<details><summary>Hint 3</summary>

kube-proxy has no single node: `kubectl get daemonset kube-proxy --namespace kube-system` shows how many Pods it has, and that number is the answer for `pods`. CoreDNS is a Deployment: `kubectl get deployment coredns --namespace kube-system` shows its kind and how many Pods are ready, which is the answer for `pods`.

</details>

<details><summary>Hint 4</summary>

The kubelet does not appear in `kubectl get pods --all-namespaces`, because it is a program on each node and not a Pod. Write `no` for `is-a-pod`. Its version is in the VERSION column of `kubectl get nodes`, for example `v1.37.0`. Put quotation marks around values that YAML would read as a number or a boolean, such as `"2"` and `"no"`.

</details>
