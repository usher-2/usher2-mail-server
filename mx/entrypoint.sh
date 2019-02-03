#!/bin/sh

set -e

postalias /etc/postfix/aliases
postmap /etc/postfix/access
postmap /etc/postfix/vmailbox
postmap /etc/postfix/virtual

exec $@

