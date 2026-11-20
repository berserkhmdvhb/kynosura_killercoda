# Persist the Shelf database

A lab of the Kynosura Kubernetes course.

The Shelf database starts with a data directory that dies with its Pod. You finish a starting file: a PersistentVolumeClaim on the CSI StorageClass and a volume that uses it. You write a marker row, delete the Pod, and show that the row is still there after the Deployment made a new one. Then you grow the claim from 1Gi to 2Gi. Run every command from the root of your checkout, in a terminal where `shelf` and `kubectl` are on your `PATH`. The lab needs the `storage` profile, which has three nodes and the driver csi-hostpath. The cluster pulls the database image from Docker Hub once.

Profile: `storage` (a kind cluster; its measured peak memory is about 1251 MiB, from ADR-0012).
Estimated time: 40 minutes.

The background script builds the course's lab environment in this VM from the course repository at commit `ed9aebc`: kind, kubectl, the `shelf` CLI and the Shelf images, then `shelf up storage` and `shelf setup lab-m19-persist-shelf-db`.

**Setup takes a few minutes. Wait for `RESULT: ready` in this terminal before you start.** If it prints `RESULT: failed`, read the log tail it shows, and send it to the course author.

Work in `/root/course`. A terminal that was open before setup ended needs `source ~/.bashrc` once, which sets `KUBECONFIG` and the folder.

License: the text of this scenario is CC BY 4.0 (see `LICENSE-CONTENT` in this repository). The course code it builds is under the Apache License 2.0 in the course repository.
