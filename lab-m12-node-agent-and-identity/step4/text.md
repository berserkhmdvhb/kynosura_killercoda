# The partitioned update

Change the label `app.kubernetes.io/version` in the Pod template from `"1"` to `"2"`, and set the partition to 2 in the same edit. Apply the file. Only `shelf-db-2` should be replaced. The two lower ordinals keep version 1 until you lower the partition, which this lab does not ask you to do.

```bash
kubectl apply --filename node-and-db/shelf-db.yaml
kubectl rollout status statefulset/shelf-db --namespace shelf
kubectl get pods --namespace shelf --label-columns app.kubernetes.io/version
```

Click **Check**. It passes when `db-partition`, `db-one-updated`, `db-ordinal-versions` pass.

## Stuck?

Run `shelf hint lab-m12-node-agent-and-identity 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

The setup tainted the worker `reconcile-worker3` and copied two drafts into `node-and-db/`. Apply `node-agent.yaml` first and compare `kubectl get daemonset shelf-node-agent --namespace shelf` with `kubectl get nodes`. The DaemonSet wants fewer Pods than there are workers. Find out why: `kubectl describe node reconcile-worker3` lists the taint.

</details>

<details><summary>Hint 2</summary>

A DaemonSet tolerates a few node condition taints by itself, and no other. Add a `tolerations` list under `spec.template.spec` with the key, value and effect of the taint on `reconcile-worker3`. Use the narrowest toleration that works: one with `operator: Exists` and no key would put the agent on the control plane as well, and the check wants exactly 3 Pods.

</details>

<details><summary>Hint 3</summary>

For the database, three things in `shelf-db.yaml` are wrong: the Service is not headless (`clusterIP: None`), the StatefulSet has one replica, and nothing partitions the update. Do it in two steps. First make the Service headless and set three replicas at version 1, apply, and wait with `kubectl rollout status statefulset/shelf-db --namespace shelf`. A Service's `clusterIP` can't be changed once it is set, so delete a Service that you already applied.

</details>

<details><summary>Hint 4</summary>

For the second step, change the label `app.kubernetes.io/version` in the Pod template from "1" to "2", and add `updateStrategy` with `rollingUpdate.partition: 2` in the same edit. Apply it. Only `shelf-db-2` is replaced, because its ordinal is at or above the partition. Check the result with `kubectl get pods --namespace shelf --label-columns app.kubernetes.io/version`. If all three Pods show 2, the template changed before the replicas existed: delete the StatefulSet and start from step one.

</details>
