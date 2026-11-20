# Reset and clean up

`shelf reset lab-m01-build-shelf-api` puts the starting files back, so `digest.txt` is empty and `shelf verify` fails. The image you pushed stays in the registry, because the registry is outside the cluster. Remove the image from your local Docker store and the cluster when you are done.

```bash
shelf reset lab-m01-build-shelf-api
docker rmi localhost:5001/m01/shelf-api:v1
shelf down
```
