# The nightly report

Edit `shelf-worker/report-cronjob.yaml`. The report must run at 03:15 every day, in the time zone Europe/Paris. A run that is still going must block the next one. The CronJob keeps 2 successful Jobs and 3 failed ones. Apply the file.

```bash
kubectl apply --filename shelf-worker/report-cronjob.yaml
kubectl get cronjob shelf-report --namespace shelf
```

Click **Check**. It passes when `report-schedule`, `report-timezone`, `report-no-overlap`, `report-history` pass.

## Stuck?

Run `shelf hint lab-m11-shelf-worker 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

The setup put two draft files in the folder `shelf-worker`, and applied a database and an api. Wait until the api is ready: `kubectl rollout status deployment/shelf-api --namespace shelf`. Its readiness means that the tables exist and the catalogue is seeded, which the worker needs. Then open the two drafts. `report-cronjob.yaml` is the CronJob with the wrong schedule and no time zone, no overlap rule and default history limits. `reindex-job.yaml` is the Job, which `kubectl apply` refuses until you fix one line.

</details>

<details><summary>Hint 2</summary>

In `report-cronjob.yaml`, under `spec`, set `schedule: "15 3 * * *"`, `timeZone: Europe/Paris`, `concurrencyPolicy: Forbid`, `successfulJobsHistoryLimit: 2` and `failedJobsHistoryLimit: 3`. Apply it, then run `kubectl create job shelf-report-manual --from=cronjob/shelf-report --namespace shelf` and watch the Job: `kubectl get jobs --namespace shelf`. The `--from` form builds a Job from the CronJob's template at once, so verify does not wait for 03:15.

</details>

<details><summary>Hint 3</summary>

`kubectl apply --filename shelf-worker/reindex-job.yaml` says the restart policy is not valid: a Job's Pod must be able to end, so use `Never`. Then add to the Job's `spec`: `completionMode: Indexed`, `completions: 4`, `parallelism: 2` and `ttlSecondsAfterFinished: 3600`. The worker rebuilds the rows whose id modulo `SHELF_WORKER_SHARDS` equals the Pod's index, so `completions` must be the same number as the shard count.

</details>

<details><summary>Hint 4</summary>

If the reindex Job fails with `BackoffLimitExceeded`, read a failed Pod's log: `kubectl logs --selector job-name=shelf-reindex --namespace shelf --tail=3`. The usual cause is a Job applied before the api was ready, so the database was not seeded or not reachable. A failed Job does not start again: delete it with `kubectl delete job shelf-reindex --namespace shelf`, and apply the file again. The `shelf-report-manual` Job has the same rule.

</details>
