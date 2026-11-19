# Can kind run here?

This scenario checks whether a kind cluster runs on this machine. The course's labs depend on it.

The setup script in the background:

1. downloads kind v0.33.0 and kubectl v1.37.2, and checks their SHA-256 sums;
2. creates a one-node cluster from `kindest/node:v1.37.0`, pinned by digest.

The terminal shows its progress, and it usually takes a few minutes. When it prints `RESULT: ready` or `RESULT: failed`, go to the next step.
