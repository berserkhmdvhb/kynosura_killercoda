# Prepare

The lab cluster must be running (`shelf up`). The setup changes nothing in the cluster. It copies a blank `answers.yaml` into a folder named `component-hunt` in your working directory.

```bash
shelf setup lab-m05-component-hunt
cat component-hunt/answers.yaml
```
Edit the copy in `component-hunt`. Don't edit the file under `labs/`, because `shelf reset` restores the blank original from there.

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
