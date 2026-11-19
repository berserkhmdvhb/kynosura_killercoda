#!/bin/bash
echo "Setting up kind (log: /tmp/kind-setup.log). This takes a few minutes."
while [ ! -f /tmp/kind-ready ] && [ ! -f /tmp/kind-failed ]; do sleep 3; printf '.'; done
echo
if [ -f /tmp/kind-ready ]; then echo "RESULT: ready, $(cat /tmp/kind-setup-seconds)"; else echo "RESULT: failed"; tail -n 20 /tmp/kind-setup.log; fi
