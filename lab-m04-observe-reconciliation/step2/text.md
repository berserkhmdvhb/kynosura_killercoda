# Scale by changing the desired state

Open `observe-reconciliation/shelf-web.yaml`, change `replicas` from 2 to 4, and apply the file. Don't use `kubectl scale`: the check `applied-from-file` reads the copy of the manifest that `kubectl apply` stores in the object, so it proves that you changed the desired state in the file. Then wait until the Deployment reports 4 of 4.

```bash
kubectl apply --filename observe-reconciliation/shelf-web.yaml
kubectl get deployment shelf-web --namespace shelf
kubectl get pods --namespace shelf
```
`desired-is-4` reads `spec.replicas`, and `four-ready` waits up to 45 seconds for `status.readyReplicas` to reach 4.

Click **Check**. It passes when `desired-is-4`, `applied-from-file`, `four-ready` pass.

## Stuck?

Run `shelf hint lab-m04-observe-reconciliation 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

The desired state lives in `observe-reconciliation/shelf-web.yaml`. Change `replicas: 2` to `replicas: 4`, save the file, and run `kubectl apply --filename observe-reconciliation/shelf-web.yaml`. Don't use `kubectl scale`: the check `applied-from-file` reads the stored copy of the manifest, which only `kubectl apply` updates.

</details>

<details><summary>Hint 2</summary>

Open a second terminal and run `kubectl get pods --namespace shelf --watch`. In the first terminal, list the Pods with `kubectl get pods --namespace shelf`, and delete one or two with `kubectl delete pod <name> --namespace shelf`. Watch the new names appear while the old Pods stop.

</details>

<details><summary>Hint 3</summary>

Run `kubectl get events --namespace shelf --field-selector reason=SuccessfulCreate --output custom-columns=REASON:.reason,SOURCE:.source.component,REPORTER:.reportingComponent`. The SOURCE column names the component that wrote each event. The message of the event shows the Pod it created.

</details>

<details><summary>Hint 4</summary>

Write the name from the SOURCE column after `controller:` in `observe-reconciliation/answers.yaml`, for example `controller: replicaset-controller`. Case does not matter, and `ReplicaSet controller` is accepted too. The Deployment's own controller creates the ReplicaSet, not the Pods, and `kube-controller-manager` is the program that hosts both.

</details>
