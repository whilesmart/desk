<p align="center">
  <img src="assets/apps/desk.svg" width="80" alt="Desk">
</p>
<h1 align="center">WhileSmart Desk</h1>

Desk is an AI-native collaboration suite for teams, bringing documents, notes, chat, calendars, and mail into one connected workspace.

## How it works

Desk follows a Google Workspace-style model: independent applications connected through one account and shared core services.

Accounts is the central, independent sign-in gateway. It runs the Central Authentication Service (CAS), so each app can use the same identity without building its own login system. Apps share workspace access information and common services such as notifications, while each backend controls access to its own data.

You can self-host the compiled applications on your own infrastructure. You can also [build apps in any backend language](https://developers.whilesmart.com/apps/desk/apps) that supports CAS authentication.

The Desk dashboard is the shared home for opening and moving between your apps.

## Included apps

| | App | Purpose |
| --- | --- | --- |
| <img src="assets/apps/files.svg" width="32" alt="Docs"> | Docs | Organize, store, and share documents and files. |
| <img src="assets/apps/mindpad.svg" width="32" alt="Mindpad"> | Mindpad | Write and organize notes and workpads. |
| <img src="assets/apps/chat.svg" width="32" alt="Chat"> | Chat | Keep team conversations together. |
| <img src="assets/apps/calendar.svg" width="32" alt="Calendar"> | Calendar | Plan events and manage your schedule. |
| <img src="assets/apps/mail.svg" width="32" alt="Mail"> | Mail | Work with email and threaded conversations. |
| <img src="assets/apps/moments.svg" width="32" alt="Moments"> | Moments | Capture and organize personal memories. |
| <img src="assets/apps/accounts.svg" width="32" alt="Accounts"> | Accounts | Manage your identity, sign-in, and account settings. |
| <img src="assets/apps/console.svg" width="32" alt="Console"> | Console | Manage organizations, members, and workspace access. |
| <img src="assets/apps/whilesmart.svg" width="32" alt="Platform"> | Platform | Access platform administration with the required administrator permissions. |

Mail delivery and AI providers require configuration. See the [hosting guide](https://developers.whilesmart.com/apps/desk/hosting) before using Desk in production.

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

Read the [Desk documentation](https://developers.whilesmart.com/apps/desk) for installation, hosting, authentication, and app development.

- [Authentication](docs/authentication.md)
- [Operations and backups](docs/operations.md)
- [Licensing and source access](docs/licensing.md)
- [Questions](docs/questions.md)

This repository distributes installation files, documentation, and compiled releases. Application source is not included.
