# Reset and clean up

`shelf reset lab-m05-component-hunt` puts the blank answer file back, so `shelf verify` fails afterwards. The cluster is untouched. Remove it with `shelf down` when you are done.

```bash
shelf reset lab-m05-component-hunt
shelf down
```
