# Prepare

The lab cluster must be running (`shelf up`). The first build pulls two base images from public registries, `golang` from Docker Hub and `distroless/static` from `gcr.io`, so the lab needs network access once. The setup creates the namespace `shelf` and copies two files into a folder named `build-shelf-api` in your working directory: a `Dockerfile` that holds only comments, and an empty `digest.txt`. Don't edit the copies under `labs/`, because `shelf reset` restores the starting files from there.

```bash
shelf setup lab-m01-build-shelf-api
cat build-shelf-api/Dockerfile
```

> The setup in the background ran `shelf up` and `shelf setup` for you where the lab needs them. Run every command from `/root/course`.
