# The settings file

The comment `TODO 3` asks for a `configMap` volume and a mount at `/etc/shelf`. The key `config.yaml` becomes the file that the api reads. When you apply the file, the Deployment rolls, because the Pod template changed. The settings then show the banner text `Configured in the lab`.

Click **Check**. It passes when `file-reaches-the-container` passes.

## Stuck?

Run `shelf hint lab-m18-configure-shelf 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

Start by applying the file as it is: `kubectl apply --filename config-lab/shelf-api.yaml`. The api runs with its defaults, and the checks that read its settings fail. Then read the five TODOs in the file one at a time, apply after each, and run `shelf verify lab-m18-configure-shelf`.

</details>

<details><summary>Hint 2</summary>

The api reports its effective settings at `/api/info`. `SHELF_PAGE_SIZE` has to come from `valueFrom.configMapKeyRef` with the key `page-size`, and the file has to appear at `/etc/shelf/config.yaml`: mount the whole ConfigMap volume at `/etc/shelf`, and the key `config.yaml` becomes that file.

</details>

<details><summary>Hint 3</summary>

A Secret volume is `secret: { secretName: shelf-db }` under `volumes`, and a `volumeMounts` entry on the container with the same volume name. Leave `secretKeyRef` and `SHELF_DB_PASSWORD` out of `env`: the check fails if the Secret reaches the environment. `immutable: true` goes at the top level of the ConfigMap, next to `data`.

</details>

<details><summary>Hint 4</summary>

The annotation goes under `spec.template.metadata`, not under the Deployment's own `metadata`, because only a change to the Pod template starts a rollout. Its key is `checksum/config`. Compute the value from the `config.yaml` text, for example by saving the two lines to a file and running `sha256sum` on it. The check wants 64 hexadecimal characters.

</details>
