# Share a log file

The api writes a copy of its log to a file when the environment variable `SHELF_LOG_FILE` holds a path. Add an `emptyDir` volume to the Pod, mount it in the api container, and set the variable to a file on it, for example `/var/log/shelf/shelf.log`.
