# Trace a packet

A lab of the Kynosura Kubernetes course.

You trace one request from a Pod on the worker to a Pod on the control plane node, and you write down what you find in an answer file: the two Pod addresses, the node's address and Pod range, the address the server sees for the caller, the veth of the sending Pod, and the number of hops. Nine checks prove it. Run every command from the root of your checkout, in a terminal where `shelf`, `kubectl` and `docker` are on your `PATH`. The setup pulls the `busybox` image from Docker Hub once, because the Shelf images have no network tools.

Profile: `default` (a kind cluster; its measured peak memory is about 933 MiB, from ADR-0012).
Estimated time: 30 minutes.

The background script builds the course's lab environment in this VM from the course repository at commit `ed9aebc`: kind, kubectl, the `shelf` CLI and the Shelf images, then `shelf up default` and `shelf setup lab-m13-trace-a-packet`.

**Setup takes a few minutes. Wait for `RESULT: ready` in this terminal before you start.** If it prints `RESULT: failed`, read the log tail it shows, and send it to the course author.

Work in `/root/course`. A terminal that was open before setup ended needs `source ~/.bashrc` once, which sets `KUBECONFIG` and the folder.

License: the text of this scenario is CC BY 4.0 (see `LICENSE-CONTENT` in this repository). The course code it builds is under the Apache License 2.0 in the course repository.
