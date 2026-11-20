# Reset and clean up

`shelf reset lab-m02-fix-the-yaml` deletes the namespace `shelf`, which removes every object that you created, and puts the five broken files back in `fix-the-yaml`. `shelf verify` fails afterwards, so you can see that the checks mean something. Then remove the cluster if you are done for now.

```bash
shelf reset lab-m02-fix-the-yaml
shelf down
```
