#!/bin/bash
# Passes (exit 0) when the kind node is Ready and the API server is v1.37.0.
[ -f /tmp/kind-ready ] || exit 1
kubectl get node smoke-control-plane -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}' | grep -qx True || exit 1
kubectl version -o json | grep -q '"gitVersion": "v1.37.0"' || exit 1
