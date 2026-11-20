# The Secret as a file

The comment `TODO 4` asks for a `secret` volume for `shelf-db`, mounted at `/var/run/secrets/shelf`. Don't put the password in `env`. The api would read the file at that path when you set `SHELF_DB_HOST`, and this lab does not run a database.

Its Check (`secret-is-a-volume`, `secret-is-mounted`, `secret-not-in-env`) runs on step 6, "Immutable", after you apply the file.
