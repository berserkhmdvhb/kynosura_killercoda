# Push and record the digest

Push the tag to the registry, then write the digest of the pushed image into `build-shelf-api/digest.txt`: only `sha256:` and 64 hexadecimal characters.

```bash
docker push localhost:5001/m01/shelf-api:v1
docker buildx imagetools inspect localhost:5001/m01/shelf-api:v1 --format '{{.Manifest.Digest}}' > build-shelf-api/digest.txt
cat build-shelf-api/digest.txt
```

Click **Check**. It passes when `image-pushed`, `digest-recorded` pass.

## Stuck?

Run `shelf hint lab-m01-build-shelf-api 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

The setup put a `Dockerfile` that holds only comments in `build-shelf-api/`. Read it, then write the two stages. The build context is the folder `apps/shelf`, so a `COPY` in your Dockerfile names paths inside it: `go.mod`, `go.sum`, `cmd`, `internal` and `web`. Build with `docker build --file build-shelf-api/Dockerfile --tag localhost:5001/m01/shelf-api:v1 apps/shelf`.

</details>

<details><summary>Hint 2</summary>

The build stage starts from a golang image and ends with `go build -o /out/shelf-api ./cmd/api` and `CGO_ENABLED=0` in front, which makes one static binary. The runtime stage starts from a second `FROM`, copies only that binary with `COPY --from=build /out/shelf-api /shelf-api`, and sets `ENTRYPOINT ["/shelf-api"]`. Pin both base images to a tag. The Shelf's own `apps/shelf/Dockerfile.api` shows the same shape, with more build options.

</details>

<details><summary>Hint 3</summary>

Without a `USER` instruction the process runs as root. Add `USER 65532:65532` in the runtime stage, after the `COPY`. Then build again and read the config with `docker image inspect --format '{{.Config.User}}' localhost:5001/m01/shelf-api:v1`. It must print the user, not an empty line.

</details>

<details><summary>Hint 4</summary>

Push the tag with `docker push localhost:5001/m01/shelf-api:v1`. The registry runs on `localhost:5001` after `shelf up`. Write the digest of the pushed image into `build-shelf-api/digest.txt`: `docker buildx imagetools inspect localhost:5001/m01/shelf-api:v1 --format '{{.Manifest.Digest}}' > build-shelf-api/digest.txt` does it in one command.

</details>
