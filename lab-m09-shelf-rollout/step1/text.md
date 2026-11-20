# Prepare

The lab cluster must be running (`shelf up`). The setup creates the namespace `shelf` and copies two Deployments, `shelf-api.yaml` and `shelf-web.yaml`, into a folder named `shelf-rollout` in your working directory. Both use image tag `v1`, 3 replicas and a progress deadline of 30 seconds. Don't edit the copies under `labs/`, because `shelf reset` restores the originals from there.

```bash
shelf setup lab-m09-shelf-rollout
cat shelf-rollout/shelf-api.yaml
```

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
