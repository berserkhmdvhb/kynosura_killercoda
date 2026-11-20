# Verify

Run the checks. A passing run prints one `PASS` line for each of the 15 checks. The checks send TCP connections from the test Pods with a two-second timeout, and compare the exit code only. A path that is allowed must connect, and a path that is denied must time out.

```bash
shelf verify lab-m17-lock-down-shelf
```
A failing check prints a `FAIL` line, the reason, and a hint. `shelf hint lab-m17-lock-down-shelf 1` shows the first hint, and there are four. A new policy needs a few seconds to be enforced, and the api needs a minute to become ready, so the allowed checks wait.

Click **Check**. It passes when every check of the lab passes.

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
