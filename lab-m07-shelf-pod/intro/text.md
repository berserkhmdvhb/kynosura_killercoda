# Shelf api with a log-shipping sidecar

A lab of the Kynosura Kubernetes course.

Run the Shelf `api` as a Pod with a log-shipping native sidecar: an init container with `restartPolicy: Always` that follows a log file on a shared `emptyDir` volume and copies it to its own stdout. The time is a target, and nothing checks it. Run every command from the root of your checkout, in a terminal where `shelf` and `kubectl` are on your `PATH`. The Shelf images must be in the local registry (`pnpm shelf:images` builds them).

Profile: `default` (a kind cluster; its measured peak memory is about 933 MiB, from ADR-0012).
Estimated time: 20 minutes.

The background script builds the course's lab environment in this VM from the course repository at commit `ed9aebc`: kind, kubectl, the `shelf` CLI and the Shelf images, then `shelf up default` and `shelf setup lab-m07-shelf-pod`.

**Setup takes a few minutes. Wait for `RESULT: ready` in this terminal before you start.** If it prints `RESULT: failed`, read the log tail it shows, and send it to the course author.

Work in `/root/course`. A terminal that was open before setup ended needs `source ~/.bashrc` once, which sets `KUBECONFIG` and the folder.

License: the text of this scenario is CC BY 4.0 (see `LICENSE-CONTENT` in this repository). The course code it builds is under the Apache License 2.0 in the course repository.
