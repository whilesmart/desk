# Build an app for Desk

A Desk app can use any backend language. It communicates with Desk over HTTP, so it does not need to share Desk's implementation language or framework.

CAS authentication is the required integration. CAS is Desk's central account service: it establishes who signed in. Your app remains responsible for deciding which records that person may read or change.

For the frontend, [WhileSmart Design](https://github.com/whilesmart/design) is recommended so your app looks and behaves consistently with Desk. You can use a different frontend stack.

## Start with authentication

1. Give your app a frontend URL and a backend URL.
2. Configure the deployment to allow the frontend origin.
3. Connect sign-in and session checks to CAS using the [authentication guide](authentication.md).
4. Check the current user and workspace on the server before every protected operation.
5. Add your app to the deployment's app catalogue and navigation where needed.

Do not accept a workspace identifier from the browser as proof of access. Check it against the user's current grants. Keep service credentials on the server.

## Add optional integrations

An app can use shared chat, notifications, documents, or calendar features when it needs them. These integrations have their own API contracts and permissions; they are not prerequisites for a standalone app that uses CAS.

Keep your app independently deployable. Publish its configuration, health endpoint, required permissions, and upgrade instructions alongside its compiled release.
