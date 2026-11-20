# kubectl drills

A lab of the Kynosura Kubernetes course.

Ten short drills, one for each skill of the module. Most end in a file that holds the output of a command, and `shelf verify` asks the cluster the same question and compares. Two drills change the cluster. Aim for 15 minutes once you know the commands: the time is a target, and nothing checks it. Run every command from the root of your checkout, in a terminal where `shelf` and `kubectl` are on your `PATH`. The Shelf images must be in the local registry (`pnpm shelf:images` builds them).

Profile: `default` (a kind cluster; its measured peak memory is about 933 MiB, from ADR-0012).
Estimated time: 15 minutes.

The background script builds the course's lab environment in this VM from the course repository at commit `ed9aebc`: kind, kubectl, the `shelf` CLI and the Shelf images, then `shelf up default` and `shelf setup lab-m06-kubectl-drills`.

**Setup takes a few minutes. Wait for `RESULT: ready` in this terminal before you start.** If it prints `RESULT: failed`, read the log tail it shows, and send it to the course author.

Work in `/root/course`. A terminal that was open before setup ended needs `source ~/.bashrc` once, which sets `KUBECONFIG` and the folder.

License: the text of this scenario is CC BY 4.0 (see `LICENSE-CONTENT` in this repository). The course code it builds is under the Apache License 2.0 in the course repository.
