# Hello, cluster

A lab of the Kynosura Kubernetes course.

You build the lab cluster and prove that it works. The lab has two checks, `context-exists` and `node-ready`. Run every command from the root of your checkout, in a terminal where `shelf`, `kind` and `kubectl` are on your `PATH` (lesson 2 shows how).

Profile: `default` (a kind cluster; its measured peak memory is about 933 MiB, from ADR-0012).
Estimated time: 15 minutes.

The background script installs kind, kubectl and the `shelf` CLI from the course repository at commit `ed9aebc`. Creating the cluster, with `shelf up`, is the first task of this lab.

**Setup takes a few minutes. Wait for `RESULT: ready` in this terminal before you start.** If it prints `RESULT: failed`, read the log tail it shows, and send it to the course author.

Work in `/root/course`. A terminal that was open before setup ended needs `source ~/.bashrc` once, which sets `KUBECONFIG` and the folder.

License: the text of this scenario is CC BY 4.0 (see `LICENSE-CONTENT` in this repository). The course code it builds is under the Apache License 2.0 in the course repository.
