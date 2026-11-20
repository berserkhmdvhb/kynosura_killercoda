# The backup

`db-lab/backup.yaml` holds the claim `shelf-db-backup` and a Job without its command. The comment `TODO 2` asks for `args`: one string that runs `pg_dump` against `shelf-db-0.shelf-db` in the custom format and writes `/backup/shelf.dump`. Apply the file, and wait for the Job.

```bash
kubectl apply --filename db-lab/backup.yaml
kubectl wait --for=condition=Complete job/shelf-db-backup --namespace shelf
kubectl logs job/shelf-db-backup --namespace shelf
```
If the Job fails, read the log, delete the Job, correct the file and apply again. A Job's template cannot be changed.

Click **Check**. It passes when `backup-succeeded` passes.

## Stuck?

Run `shelf hint lab-m20-shelf-db-statefulset 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

Start with the database. Read the TODO 1 comment in `db-lab/shelf-db.yaml`: the volume `data` is an `emptyDir`, and it must become a claim for each Pod. Remove that volume and add a `volumeClaimTemplates` list at the end of the StatefulSet's spec. If you applied the file before you changed it, delete the StatefulSet first, because the field cannot be changed afterwards. Then run `shelf verify lab-m20-shelf-db-statefulset`.

</details>

<details><summary>Hint 2</summary>

The template is a PersistentVolumeClaim without a name of its own in the spec: `metadata.name: data`, `spec.accessModes: ["ReadWriteOnce"]` and `spec.resources.requests.storage: 1Gi`. The Pod's volumeMount already says `data`, so the mount stays as it is. After you apply the file, `kubectl get pods,pvc --namespace shelf` shows `shelf-db-0` and `data-shelf-db-0`. Write the marker row now, before any backup: `kubectl exec shelf-db-0 --namespace shelf -- psql --username shelf --dbname shelf --command "create table marker (note text, written_at timestamptz default now()); insert into marker (note) values ('before the backup');"`.

</details>

<details><summary>Hint 3</summary>

The backup Job needs one string in `args`: `pg_dump --host shelf-db-0.shelf-db --username shelf --dbname shelf --format custom --file /backup/shelf.dump`. The Job's Pod reaches the database through the name of the Pod and of the headless Service, and it reads the password from `PGPASSWORD`, which the file already sets. Apply `db-lab/backup.yaml` and wait with `kubectl wait --for=condition=Complete job/shelf-db-backup --namespace shelf`. A Job's template cannot be changed, so after a mistake delete the Job and apply the file again.

</details>

<details><summary>Hint 4</summary>

Simulate the loss first: `kubectl exec shelf-db-0 --namespace shelf -- psql --username shelf --dbname postgres --command 'drop database shelf with (force)'`. The restore Job's `args` are `createdb --host shelf-db-0.shelf-db --username shelf --maintenance-db postgres shelf && pg_restore --host shelf-db-0.shelf-db --username shelf --dbname shelf --exit-on-error /backup/shelf.dump`. Apply `db-lab/restore.yaml`, wait for the Job, and read the marker row with `psql --dbname shelf --command 'select note from marker'`. If createdb says the database exists, you did not drop it.

</details>
