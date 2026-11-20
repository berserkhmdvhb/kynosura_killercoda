# A row that survives

The comment `TODO 3` is not in the file: it is a task for the cluster. Write a marker row into the database, delete the Pod, and wait for the Deployment to make a new one. The row has the time it was written, and the check compares it with the start time of the database server that is running now.

```bash
kubectl exec deployment/shelf-db --namespace shelf -- psql --username shelf --dbname shelf --command "create table marker (note text, written_at timestamptz default now()); insert into marker (note) values ('before the Pod was deleted');"
kubectl delete pod --namespace shelf --selector app.kubernetes.io/name=shelf-db
kubectl rollout status deployment/shelf-db --namespace shelf
kubectl exec deployment/shelf-db --namespace shelf -- psql --username shelf --dbname shelf --command "select note from marker"
```
The last command prints the row. If `psql` reports that the table does not exist, the claim was not mounted when you wrote the row: go back to step 4.

Click **Check**. It passes when `marker-survived` passes.

## Stuck?

Run `shelf hint lab-m19-persist-shelf-db 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

Start by applying the file as it is: `kubectl apply --filename persist-lab/shelf-db.yaml`. The database runs, but its data directory is an `emptyDir`, and the checks about the claim fail. Read the TODOs in the file one at a time, apply after each, and run `shelf verify lab-m19-persist-shelf-db`.

</details>

<details><summary>Hint 2</summary>

The claim is a second object in the same file, above the Deployment, with `---` between them. Its spec has `storageClassName: csi-hostpath-sc`, `accessModes: ["ReadWriteOnce"]` and `resources.requests.storage: 1Gi`. In the Deployment, the volume `data` loses `emptyDir: {}` and gets `persistentVolumeClaim` with `claimName: shelf-db-data`. Apply the file: the Deployment makes a new Pod that mounts the claim.

</details>

<details><summary>Hint 3</summary>

Write the row only after the Pod mounts the claim. Run `psql` in the Pod with `kubectl exec deployment/shelf-db --namespace shelf -- psql --username shelf --dbname shelf --command "..."`. The statements are in the lab page: they create a table named `marker` with a `written_at` column that defaults to `now()`. Then delete the Pod, not the Deployment, and wait for the new Pod to be Ready. The check compares the row's time with the start time of the database server.

</details>

<details><summary>Hint 4</summary>

Expansion is one change to the claim: `spec.resources.requests.storage` goes from 1Gi to 2Gi. Edit the file and apply it, or run `kubectl patch pvc shelf-db-data --namespace shelf --patch '{"spec":{"resources":{"requests":{"storage":"2Gi"}}}}'`. The class `csi-hostpath-sc` has `allowVolumeExpansion: true`, so the API server accepts it, and the claim's capacity changes after the driver has resized the volume. Run `kubectl get pvc --namespace shelf` until CAPACITY reads 2Gi.

</details>
