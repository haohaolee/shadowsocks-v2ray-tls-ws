#!/usr/bin/env sh

set -xe

CERT_PATH="${CERT_DIR}/${DOMAIN}.cer"
KEY_PATH="${CERT_DIR}/${DOMAIN}.key"

if [ ! -f "${CERT_PATH}" ] || [ ! -f "${KEY_PATH}" ]; then
    echo "No cert or key file exist"
    exit 0
fi

ARGS="--plugin v2ray-plugin --plugin-opts server;tls;host=$DOMAIN;path=/v2ray;cert=$CERT_PATH;key=$KEY_PATH -u"

exec ss-server \
    -s $SERVER_ADDR \
    -p $SERVER_PORT \
    -k $PASSWORD \
    -m $METHOD \
    -t $TIMEOUT \
    -d $DNS_ADDRS \
    --reuse-port \
    --no-delay \
    $ARGS

