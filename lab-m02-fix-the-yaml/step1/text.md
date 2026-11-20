# Prepare

The lab cluster must be running (`shelf up`). The `kubeconform` checks fetch the schemas over the network on their first run, so the lab needs network access once. Install kubeconform if you don't have it: run `scripts/install-tools.sh kubeconform` from the course repository, then `. scripts/env.sh`. Then run the lab setup. It creates the namespace `shelf` and copies five broken files into a folder named `fix-the-yaml` in your working directory.

```bash
shelf setup lab-m02-fix-the-yaml
ls fix-the-yaml
```
Edit the files in `fix-the-yaml`. Don't edit the copies under `labs/`, because `shelf reset` restores the broken files from there.

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
