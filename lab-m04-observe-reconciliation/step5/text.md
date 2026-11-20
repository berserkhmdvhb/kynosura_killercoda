# Verify

Run the checks. A passing run prints one `PASS` line for each of the five checks.

```bash
shelf verify lab-m04-observe-reconciliation
```
A failing check prints a `FAIL` line and a hint under it. Fix that one thing and run `shelf verify` again. `shelf hint lab-m04-observe-reconciliation 1` shows the first hint, and there is a hint for each of the four parts.

Click **Check**. It passes when every check of the lab passes.

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
