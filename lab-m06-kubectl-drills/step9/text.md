# diff and apply

Open `kubectl-drills/shelf-web.yaml` and change `replicas` from 2 to 3. Before you apply it, run `kubectl diff` on the file and write its output into `kubectl-drills/diff.txt`. The command exits with 1 when it finds a difference, which is normal. Then apply the file. Don't use `kubectl scale`: the check `applied-replicas` reads the copy of the manifest that `kubectl apply` stores in the object.

```bash
kubectl diff --filename kubectl-drills/shelf-web.yaml > kubectl-drills/diff.txt
kubectl apply --filename kubectl-drills/shelf-web.yaml
kubectl get deployment shelf-web --namespace shelf
```

Click **Check**. It passes when `diff-output`, `applied-replicas` pass.

## Stuck?

Run `shelf hint lab-m06-kubectl-drills 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

Every drill but one ends in a file in `kubectl-drills/`, and the redirect `>` is how you fill it: `kubectl config current-context > kubectl-drills/context.txt`. Run each command first without the redirect, so you see what it prints, then add it. `shelf verify` reads the files and asks the cluster the same questions.

</details>

<details><summary>Hint 2</summary>

Most commands need `--namespace shelf`, because your context may use the `default` namespace. Selectors use `--selector` with a label such as `app.kubernetes.io/component=backend`, and the output formats are `--output jsonpath=...` and `--output custom-columns=...`. Quote the whole argument when it holds brackets or braces.

</details>

<details><summary>Hint 3</summary>

Do the diff before the apply. Edit `replicas` in `kubectl-drills/shelf-web.yaml`, run `kubectl diff --filename kubectl-drills/shelf-web.yaml > kubectl-drills/diff.txt`, read the file, and only then run `kubectl apply --filename kubectl-drills/shelf-web.yaml`. `kubectl diff` exits with 1 when it finds differences, so a failing exit code here is the normal case.

</details>

<details><summary>Hint 4</summary>

The Shelf images have no shell, so `kubectl exec` runs a program of the image itself: `kubectl exec deployment/shelf-web --namespace shelf -- /shelf-web healthcheck`. It prints nothing and exits 0 when the server answers. For the explain drill, `kubectl explain deployment.spec.progressDeadlineSeconds` ends with the default in words. The generated Namespace manifest comes from `kubectl create namespace shelf-scratch --dry-run=client --output yaml`.

</details>
