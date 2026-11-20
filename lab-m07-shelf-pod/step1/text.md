# Prepare

The lab cluster must be running (`shelf up`). The setup creates the namespace `shelf` and copies `shelf-api.yaml` into a folder named `shelf-pod` in your working directory. The file holds the api container alone. Don't edit the copy under `labs/`, because `shelf reset` restores the original from there.

```bash
shelf setup lab-m07-shelf-pod
cat shelf-pod/shelf-api.yaml
```

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
