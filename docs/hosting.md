# Host Desk

Use the local setup to evaluate a release. Before serving other people, configure your own hostnames, HTTPS, storage, mail delivery, and backups.

## Configure the deployment

1. Choose stable hostnames for the dashboard, Accounts, Console, and each app.
2. Terminate HTTPS at your reverse proxy and route each hostname to its app.
3. Configure CAS allowed origins, secure cookies, verification links, and password-reset links for those hostnames.
4. Keep databases and internal service endpoints on a private network.
5. Configure persistent object storage and a real mail provider. The local mail viewer is for evaluation only.
6. Store credentials outside Git and back up them alongside the data needed for recovery.

The bundled local frontend images target localhost. A production release must match the public URLs of its deployment. Do not point an internet-facing installation at somebody else's CAS or mail service.

## Upgrade

Back up databases, stored documents, mail data, and deployment settings before changing a release. Retain the previous compiled images and configuration for rollback.

Start the new release, check service health, then sign in and exercise the apps you use. Restoring older application images alone does not reverse database changes.
