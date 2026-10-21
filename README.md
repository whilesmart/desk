# WhileSmart Desk

Desk is a self-hostable workspace for accounts, documents, notes, chat, calendars, and mail. Run the compiled applications on your own infrastructure and keep your data under your control.

## Run locally

On Linux amd64, install Docker with Compose, Make, Python 3, curl, and gzip. Download this repository, then run:

```sh
make
```

The setup downloads compiled container images, creates local credentials, and starts Desk. It does not compile application source.

Open the [local dashboard](http://localhost:3001). Run `make credentials` to display the initial administrator login.

For direct Compose use, run `make prepare` once, then `docker compose up -d --wait` and `docker compose run --rm bootstrap`. Stop Desk with `make stop`; your data stays in Docker volumes.

See [local installation](docs/installation.md), [production hosting](docs/hosting.md), and [building apps](docs/apps.md).

## Documentation

- [Authentication](docs/authentication.md)
- [Operations and backups](docs/operations.md)
- [Licensing and source access](docs/licensing.md)
- [Questions](docs/questions.md)

This repository distributes installation files, documentation, and compiled releases. Application source is not included.
