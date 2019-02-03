#!/bin/sh

set -e

if [ -e "/etc/dovecot/users" ]; then
        chown dovecot:mail /etc/dovecot/users
fi

exec $@

