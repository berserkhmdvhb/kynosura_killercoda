#!/bin/bash
# Setup for the kind smoke test. Every tool is pinned, with the versions and SHA-256 sums from the course's tools/pins.tsv.
set -uo pipefail
LOG=/tmp/kind-setup.log
exec >"$LOG" 2>&1
start=$(date +%s)
fail() { echo "FAILED: $1"; echo "seconds: $(( $(date +%s) - start ))" > /tmp/kind-setup-seconds; touch /tmp/kind-failed; exit 1; }

fetch() { # url sha256 target
  curl -fsSL --retry 3 -o "$3" "$1" || fail "download $1"
  echo "$2  $3" | sha256sum -c - || fail "checksum $3"
  chmod +x "$3"
}
fetch https://github.com/kubernetes-sigs/kind/releases/download/v0.33.0/kind-linux-amd64 aee6151561422756b764a4ae28e7f44cda5af5a9eead3cc9985112b1de8d8e0d /usr/local/bin/kind
fetch https://dl.k8s.io/release/v1.37.2/bin/linux/amd64/kubectl c04487523e7aa7d1493f7808174c899db93d7a9cf57531420cd76b9bd415f8f4 /usr/local/bin/kubectl

docker version >/dev/null || fail "docker is not available"
# kind needs more inotify watches than the Ubuntu default (kind known issues).
sysctl -w fs.inotify.max_user_watches=524288 fs.inotify.max_user_instances=512 || true

kind create cluster --name smoke --wait 180s \
  --image kindest/node:v1.37.0@sha256:a1ed56cfb0e7b93589bdf97c8cd566405a265939e3620fc4f5de89adff580ae5 \
  || fail "kind create cluster"

echo "seconds: $(( $(date +%s) - start ))" > /tmp/kind-setup-seconds
touch /tmp/kind-ready
echo "DONE"
