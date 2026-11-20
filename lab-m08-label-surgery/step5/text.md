# Use a second namespace

Create the namespace `shelf-staging`, and run one Pod in it with the labels `app.kubernetes.io/name` and `app.kubernetes.io/part-of: shelf`. Use the image `localhost:5001/shelf/web:v1`. The Pod's name is your choice.

```bash
kubectl create namespace shelf-staging
kubectl get pods --namespace shelf-staging --show-labels
```

Click **Check**. It passes when `staging-namespace`, `staging-pod` pass.

## Stuck?

Run `shelf hint lab-m08-label-surgery 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

Task 1 is in the file that `shelf setup` copied: `label-surgery/shelf-web.yaml`. Add the labels under `spec.template.metadata.labels`, beside `app: shelf-web`, and leave `spec.selector` alone: a selector cannot change, and the Pods still need `app: shelf-web` to match it. Then run `kubectl apply --filename label-surgery/shelf-web.yaml`.

</details>

<details><summary>Hint 2</summary>

Task 2 changes a label on a running Pod, with no file. `kubectl label pod shelf-api-a --namespace shelf app.kubernetes.io/name=shelf-api-quarantine --overwrite` makes it stop matching the selector of the ReplicaSet `shelf-api`. Check the result with `kubectl get pods --namespace shelf --label-columns app.kubernetes.io/name`: you should see three Pods, and a replacement with a generated name.

</details>

<details><summary>Hint 3</summary>

Task 3 is `kubectl annotate deployment shelf-web --namespace shelf kubernetes.io/change-cause="add the recommended labels"`. The key can also be an owner of your own, such as `shelf.example/owner=books-team`. `kubectl rollout history deployment/shelf-web --namespace shelf` shows the cause of the current revision.

</details>

<details><summary>Hint 4</summary>

Task 4 has two parts: `kubectl create namespace shelf-staging`, then a Pod in it. `kubectl run` takes `--labels` as a comma-separated list, for example `--labels=app.kubernetes.io/name=shelf-web,app.kubernetes.io/part-of=shelf`, and the image is `localhost:5001/shelf/web:v1`. A manifest with `metadata.namespace: shelf-staging` works as well.

</details>
