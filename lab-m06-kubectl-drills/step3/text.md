# Namespaces

The cluster DNS runs as a Deployment with the label `k8s-app=kube-dns`, in a namespace that you do not know yet. Find it across all namespaces, and write only the namespace, with no table, into `kubectl-drills/dns-namespace.txt`. Use `--output jsonpath`.

Click **Check**. It passes when `dns-namespace` passes.

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
