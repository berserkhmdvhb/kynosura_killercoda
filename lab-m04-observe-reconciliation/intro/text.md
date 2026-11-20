# Observe reconciliation

A lab of the Kynosura Kubernetes course.

You change the desired state of a running Deployment, delete its Pods, and watch a controller bring them back. Then you write down which controller did it, and the lab checks your answer against what the cluster's own events say. Five checks prove it. Run every command from the root of your checkout, in a terminal where `shelf` and `kubectl` are on your `PATH`. The Shelf images must be in the local registry (`pnpm shelf:images` builds them).

Profile: `default` (a kind cluster; its measured peak memory is about 933 MiB, from ADR-0012).
Estimated time: 25 minutes.

The background script builds the course's lab environment in this VM from the course repository at commit `ed9aebc`: kind, kubectl, the `shelf` CLI and the Shelf images, then `shelf up default` and `shelf setup lab-m04-observe-reconciliation`.

**Setup takes a few minutes. Wait for `RESULT: ready` in this terminal before you start.** If it prints `RESULT: failed`, read the log tail it shows, and send it to the course author.

Work in `/root/course`. A terminal that was open before setup ended needs `source ~/.bashrc` once, which sets `KUBECONFIG` and the folder.

License: the text of this scenario is CC BY 4.0 (see `LICENSE-CONTENT` in this repository). The course code it builds is under the Apache License 2.0 in the course repository.
