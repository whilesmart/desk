# Operate Desk

Check running services:

```sh
docker compose ps
docker compose logs --tail=100 cas files-api
```

Stop services without deleting their volumes:

```sh
make stop
```

## Backups

Back up PostgreSQL, document storage, mail storage, and the local `.env` credentials. Keep backups outside the host and test restoring them into a separate installation.

Do not run `docker compose down --volumes` on an installation whose data you need. It removes the named data volumes.

## Access errors

A `401` means the session needs attention. A `403` means a request was denied. Record the failing method, URL, response body, and selected workspace before changing permissions.

Workspace view access does not permit creation. Folder edit access permits edits within that folder; it does not imply workspace-wide edit access.
