# Find every problem

kubeconform checks all five files against the Kubernetes 1.37 schema. The check passes when the command exits with status 0. The first run fetches the schema over the network.

```bash
kubeconform -strict -summary -kubernetes-version 1.37.0 fix-the-yaml
```
Each problem line starts with a file name. The five files hold five different problems: a tab, a shifted line, a quoted number, an unquoted number, and a missing separator. Fix one file, run the command again, and watch the list shrink.

Click **Check**. It passes when `yaml-valid` passes.

## Stuck?

Run `shelf hint lab-m02-fix-the-yaml 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

Start with `shelf-config.yaml`. Run `kubeconform -strict -summary -kubernetes-version 1.37.0 fix-the-yaml` and read the line for that file: it names a line number and a character that cannot start a token. YAML allows spaces only for indentation, so replace each tab at the start of a line with two spaces.

</details>

<details><summary>Hint 2</summary>

`shelf-web-pod.yaml` parses, but kubeconform says `ports` is not allowed at `/spec`. The key sits one level too high: it is a sibling of `containers`, and it belongs to the container. Indent the `ports` list so it lines up with `image`.

</details>

<details><summary>Hint 3</summary>

`shelf-web-service.yaml` says it got a string where it wants an integer. Look at `port` under `spec.ports`. A quoted `"80"` is text. Remove the quotation marks and keep the number.

</details>

<details><summary>Hint 4</summary>

`shelf-api-pod.yaml` says it got a number where it wants a string. The field is `value` of an environment variable, and Kubernetes stores every environment variable as text. Quote it: `"8081"`.

</details>

<details><summary>Hint 5</summary>

`shelf-worker.yaml` holds two objects, but the file shows only one document: kubeconform complains that keys such as `apiVersion` are already set. Put a line with three dashes, `---`, between the ConfigMap and the ServiceAccount.

</details>
