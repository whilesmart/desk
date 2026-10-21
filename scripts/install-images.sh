#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
release=$(sed -n 's/^DESK_RELEASE=//p' .env)
if [ -z "$release" ]; then
  echo 'DESK_RELEASE is missing from .env' >&2
  exit 1
fi
case "$(uname -m)" in
  x86_64|amd64) arch=amd64 ;;
  *) echo 'This release currently supports Linux amd64 containers.' >&2; exit 1 ;;
esac
ready=true
for image in cas console-api files-api mail-api calendar-api chat-api web mindpad; do
  docker image inspect "desk-local/$image:$release" >/dev/null 2>&1 || ready=false
done
if [ "$ready" = true ]; then exit 0; fi
mkdir -p .downloads
archive="desk-images-linux-$arch.tar.gz"
base="https://github.com/whilesmart/desk/releases/download/$release"
curl --fail --location "$base/SHA256SUMS" --output .downloads/SHA256SUMS
curl --fail --location "$base/$archive" --output ".downloads/$archive"
(cd .downloads && sha256sum --check SHA256SUMS)
gzip -dc ".downloads/$archive" | docker load
