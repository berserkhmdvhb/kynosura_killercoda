#!/bin/bash
echo "Setting up the lab (log: /tmp/shelf-setup.log). This takes a few minutes."
while [ ! -f /tmp/shelf-ready ] && [ ! -f /tmp/shelf-failed ]; do sleep 3; printf '.'; done
echo
if [ -f /tmp/shelf-ready ]; then echo "RESULT: ready, $(cat /tmp/shelf-setup-seconds)"; else echo "RESULT: failed: $(cat /tmp/shelf-failed)"; tail -n 20 /tmp/shelf-setup.log; fi
