# The claim

The comment `TODO 1` asks for a PersistentVolumeClaim named `shelf-db-data`: 1Gi, ReadWriteOnce, on the class `csi-hostpath-sc`. Add it to the file above the Deployment, with `---` between the two objects. Lesson 3 explains why the claim binds at once on this class.

Its Check (`claim-bound`, `claim-class`) runs on step 4, "The volume", after you apply the file.
