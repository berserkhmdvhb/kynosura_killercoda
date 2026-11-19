# kynosura_killercoda

Killercoda scenarios for the Kynosura Kubernetes course. Each folder that holds an `index.json` is one scenario, and Killercoda syncs this repository on every push to `main`.

| Scenario | What it does |
|---|---|
| `kind-smoke` | A feasibility test: it installs pinned kind and kubectl, creates a one-node Kubernetes v1.37.0 kind cluster, and checks that its node is Ready. |

The course's lab scenarios will be generated into this repository by the course's exporter, `scripts/export-killercoda.ts`.
