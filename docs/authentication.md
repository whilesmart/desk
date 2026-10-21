# Authenticate with CAS

CAS is Desk's central authentication service. Apps use the same accounts and sessions instead of maintaining another password database.

## Check a session

A backend can send the user's bearer token to CAS:

```sh
curl --fail "$CAS_URL/auth/me" \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

A successful response includes `user` and `owners`. An owner identifies a personal or team workspace. A team owner can include a `scope` containing its role and resource grants.

Use the response to identify the person and check workspace access. Authentication alone does not grant access to every workspace or document.

## Browser sessions

First-party web apps use the CAS session cookie and send requests with credentials enabled. Configure allowed origins and cookie settings for your deployment. Production cookies require HTTPS and settings appropriate to the app hostnames.

Never place a service credential in frontend JavaScript. Do not trust a user ID or owner header supplied by the browser without validating it against CAS.

## Handle failures

- `401`: the session is missing, expired, or invalid. Ask the user to sign in again.
- `403`: the user or request lacks required access. Explain the missing permission rather than asking them to retry indefinitely.

Use the deployed service's API documentation for its current request and response contracts.
