# Fix the YAML

A lab of the Kynosura Kubernetes course.

You repair five broken manifests, and each one has a different pitfall from lesson 2. Seven checks prove two things: kubeconform accepts every file, and the objects that you apply mean what the Shelf needs. Run every command from the root of your checkout, in a terminal where `shelf`, `kubectl` and `kubeconform` are on your `PATH`.

Profile: `default` (a kind cluster; its measured peak memory is about 933 MiB, from ADR-0012).
Estimated time: 25 minutes.

The background script builds the course's lab environment in this VM from the course repository at commit `ed9aebc`: kind, kubectl, the `shelf` CLI and the Shelf images, then `shelf up default` and `shelf setup lab-m02-fix-the-yaml`.

**Setup takes a few minutes. Wait for `RESULT: ready` in this terminal before you start.** If it prints `RESULT: failed`, read the log tail it shows, and send it to the course author.

Work in `/root/course`. A terminal that was open before setup ended needs `source ~/.bashrc` once, which sets `KUBECONFIG` and the folder.

License: the text of this scenario is CC BY 4.0 (see `LICENSE-CONTENT` in this repository). The course code it builds is under the Apache License 2.0 in the course repository.
