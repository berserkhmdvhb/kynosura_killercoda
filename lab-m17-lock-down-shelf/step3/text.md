# DNS

Allow every Pod of the namespace to send DNS to kube-dns. The peer needs a `namespaceSelector` on `kubernetes.io/metadata.name: kube-system` and a `podSelector` on `k8s-app: kube-dns`, in one list item, on UDP and TCP port 53. Add the policy to `netpol-lab/policies.yaml` and apply the file.

Click **Check**. It passes when `dns-from-web`, `dns-from-db` pass.

## Stuck?

Run `shelf hint lab-m17-lock-down-shelf 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

The setup left the Shelf running (web, api, db and cache) and no policy at all, so every path is open and the checks for denied paths fail. Read what the checks name: the allowed paths are web to api, api to db, api to cache and a visitor to web, and every Pod needs DNS. Everything else must be denied. Start from `netpol-lab/policies.yaml`: it already denies everything in both directions.

</details>

<details><summary>Hint 2</summary>

An allow between two Pods is two policies, because a connection needs both ends. For web to api: an ingress policy that selects the api Pods (`app.kubernetes.io/component: api`) and lists web as a peer on TCP 8081, and an egress policy that selects the web Pods and lists api on TCP 8081. The api to db and api to cache allows have the same two halves. The visitor to web needs one policy only, because nothing in `shelf` selects the visitor.

</details>

<details><summary>Hint 3</summary>

After default-deny egress the Pods cannot look up names, and the api cannot become ready: its readiness check needs the database, and it looks up the name `db` first. Add one egress policy with an empty `podSelector` (every Pod of the namespace) that allows UDP and TCP port 53 to the Pods labeled `k8s-app: kube-dns` in the namespace labeled `kubernetes.io/metadata.name: kube-system`. A peer that has both a `namespaceSelector` and a `podSelector` in the same list item means Pods that match the second in the namespaces that match the first.

</details>

<details><summary>Hint 4</summary>

The visitor's policy is an ingress policy on the web Pods with a peer `namespaceSelector` on `kubernetes.io/metadata.name: outside`, TCP 8080. If a check still fails after you apply the file, run `kubectl describe networkpolicy --namespace shelf` and read each policy as: which Pods it selects, which direction it isolates, which peers and ports it allows. Give a policy a moment to be enforced and the api a moment to become ready.

</details>
