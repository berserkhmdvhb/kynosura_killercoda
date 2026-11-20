# Lock down the Shelf

A lab of the Kynosura Kubernetes course.

The Shelf runs in the namespace `shelf`, and nothing stops any Pod from reaching any other. You write the NetworkPolicies that allow the four connections the Shelf needs and DNS, and nothing else, and then probe the result from test Pods. Run every command from the root of your checkout, in a terminal where `shelf` and `kubectl` are on your `PATH`. The lab needs the `netpol` profile, because its network plugin enforces policies. The Shelf images must be in the local registry (`pnpm shelf:images` builds them), and the first setup pulls the `busybox` image of the test Pods from the internet once.

Profile: `netpol` (a kind cluster; its measured peak memory is about 1035 MiB, from ADR-0012).
Estimated time: 45 minutes.

The background script builds the course's lab environment in this VM from the course repository at commit `ed9aebc`: kind, kubectl, the `shelf` CLI and the Shelf images, then `shelf up netpol` and `shelf setup lab-m17-lock-down-shelf`.

**Setup takes a few minutes. Wait for `RESULT: ready` in this terminal before you start.** If it prints `RESULT: failed`, read the log tail it shows, and send it to the course author.

Work in `/root/course`. A terminal that was open before setup ended needs `source ~/.bashrc` once, which sets `KUBECONFIG` and the folder.

License: the text of this scenario is CC BY 4.0 (see `LICENSE-CONTENT` in this repository). The course code it builds is under the Apache License 2.0 in the course repository.
