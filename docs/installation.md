# Install locally

The local release runs Linux amd64 containers. You need Docker Engine with the Compose plugin, Make, Python 3, curl, gzip, and sha256sum. The applications arrive as compiled images; no compiler or application source is needed.

## Start Desk

```sh
make
```

Setup creates a private `.env` file, downloads the release archive, checks its checksum, loads the images, and starts the services. It creates one administrator only when the account database is empty. Running setup again does not change existing passwords.

Display the administrator login:

```sh
make credentials
```

| App | Local address |
| --- | --- |
| Accounts | http://localhost:3000 |
| Dashboard | http://localhost:3001 |
| Mail | http://localhost:3002 |
| Console | http://localhost:3003 |
| Docs | http://localhost:3004 |
| Calendar | http://localhost:3005 |
| Moments | http://localhost:3006 |
| Chat | http://localhost:3007 |
| Platform | http://localhost:3008 |
| Mindpad | http://localhost:3009 |

All published ports bind to this computer's loopback interface.

## Use Compose directly

```sh
make prepare
docker compose up -d --wait
docker compose run --rm bootstrap
```

## Keep your data

```sh
make stop
```

The databases and documents remain in Docker volumes. Keep `.env`: it contains the credentials needed by this installation. Do not commit it.

## Configure external services

The local setup uses an initial administrator and local document storage. Mail delivery, registration emails, and password-reset emails need your own mail configuration and HTTPS URLs. Mail's frontend and API start without a mail provider; sending and receiving mail require a configured provider. Optional model-backed features need separate provider credentials.

Use the [hosting guide](hosting.md) before exposing this evaluation setup to other computers.
