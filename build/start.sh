#!/usr/bin/env sh

set -x


if [ "$1" == "daemon" ]; then

  mkdir -p "${CERT_DIR}"

  CERT_PATH="${CERT_DIR}/${DOMAIN}.cer"
  KEY_PATH="${CERT_DIR}/${DOMAIN}.key"

  touch $CERT_PATH; chmod 644 $CERT_PATH
  touch $KEY_PATH; chmod 644 $KEY_PATH

  RENEW_SKIP=2
  acme.sh  --register-account  -m mypersonalsecureemail@proton.me --server zerossl


  acme.sh --issue -d "$DOMAIN" --standalone --keylength ec-256 --reloadcmd "$RELOADCMD" \
      --key-file "$KEY_PATH" --fullchain-file "$CERT_PATH"
  ret=$?

  [ "$ret" != "$RENEW_SKIP" ] && [ "$ret" != "0" ] && exit 1;

  trap "echo stop && killall crond && exit 0" SIGTERM SIGINT
  exec -- crond -f

else
  exec -- "$@"
fi

