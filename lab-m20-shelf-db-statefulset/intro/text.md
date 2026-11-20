# Back up and restore the Shelf database

A lab of the Kynosura Kubernetes course.

The Shelf database needs a home that survives its Pod, and a backup that you have restored at least once. You finish three starting files: a StatefulSet with a `volumeClaimTemplates` entry, a backup Job and a restore Job. You write a marker row, back it up, drop the database, and restore it into a fresh one. Run every command from the root of your checkout, in a terminal where `shelf` and `kubectl` are on your `PATH`. The lab uses the `default` profile. The cluster pulls the database image from Docker Hub once.

Profile: `default` (a kind cluster; its measured peak memory is about 933 MiB, from ADR-0012).
Estimated time: 50 minutes.

The background script builds the course's lab environment in this VM from the course repository at commit `ed9aebc`: kind, kubectl, the `shelf` CLI and the Shelf images, then `shelf up default` and `shelf setup lab-m20-shelf-db-statefulset`.

**Setup takes a few minutes. Wait for `RESULT: ready` in this terminal before you start.** If it prints `RESULT: failed`, read the log tail it shows, and send it to the course author.

Work in `/root/course`. A terminal that was open before setup ended needs `source ~/.bashrc` once, which sets `KUBECONFIG` and the folder.

License: the text of this scenario is CC BY 4.0 (see `LICENSE-CONTENT` in this repository). The course code it builds is under the Apache License 2.0 in the course repository.
