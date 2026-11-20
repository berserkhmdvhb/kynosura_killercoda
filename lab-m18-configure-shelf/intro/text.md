# Configure the Shelf api

A lab of the Kynosura Kubernetes course.

The Shelf api runs from one image, and everything it needs to know comes from outside. You finish a starting file: a ConfigMap with a page size and a settings file, a Deployment that reads both, and a Secret that the api mounts as a file, never as an env var. Then you make the ConfigMap immutable and add the checksum annotation that rolls the Deployment when the config changes. Run every command from the root of your checkout, in a terminal where `shelf` and `kubectl` are on your `PATH`. The lab needs the `default` profile, and the Shelf api image must be in the local registry (`pnpm shelf:images` builds it).

Profile: `default` (a kind cluster; its measured peak memory is about 933 MiB, from ADR-0012).
Estimated time: 40 minutes.

The background script builds the course's lab environment in this VM from the course repository at commit `ed9aebc`: kind, kubectl, the `shelf` CLI and the Shelf images, then `shelf up default` and `shelf setup lab-m18-configure-shelf`.

**Setup takes a few minutes. Wait for `RESULT: ready` in this terminal before you start.** If it prints `RESULT: failed`, read the log tail it shows, and send it to the course author.

Work in `/root/course`. A terminal that was open before setup ended needs `source ~/.bashrc` once, which sets `KUBECONFIG` and the folder.

License: the text of this scenario is CC BY 4.0 (see `LICENSE-CONTENT` in this repository). The course code it builds is under the Apache License 2.0 in the course repository.
