# Add the sidecar

Add a second container under `initContainers`, with `restartPolicy: Always`, that mounts the same volume at the same path. Use the image `localhost:5001/shelf/worker:v1`, whose entrypoint is the Shelf worker. The worker command `logtail --file <path>` follows a file and copies each line to its own stdout. The name of the sidecar is your choice, and any image and command that ships the file's lines to stdout works.

Its Check (`native-sidecar`) runs on step 4, "Apply and wait", after you apply the file.
