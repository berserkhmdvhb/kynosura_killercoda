# Delete Pods and watch the replacements

Open a second terminal and watch the Pods. Then delete one or two Pods by name in the first terminal, and watch new names appear while the old Pods stop. No check reads this step, because the evidence is in the events that it leaves.

```bash
kubectl get pods --namespace shelf --watch
kubectl delete pod <name> --namespace shelf
```
Replace `<name>` with a Pod name from the list. Stop the watch with Ctrl+C when the Pods are back to 4 of 4.
