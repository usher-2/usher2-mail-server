FROM alpine:3.8

MAINTAINER Phil Kulin <schors@gmail.com>

RUN addgroup -S -g 90 dovecot \
 && adduser -S -u 90 -D -s /sbin/nologin -H -h /dev/null -G dovecot -g dovecot dovecot \
 && addgroup -S -g 91 dovenull \
 && adduser -S -u 91 -D -s /sbin/nologin -H -h /dev/null -G dovenull -g dovenull dovenull \
 && addgroup -g 101 postfix \
 && adduser -u 101 -D -H -h /var/spool/postfix -G postfix -g postfix postfix \
 && addgroup postfix mail \
 && addgroup -g 102 postdrop \
 && addgroup -g 5000 vmail \
 && adduser -u 5000 -D -s /sbin/nologin -H -h /dev/null -G vmail -g vmail vmail \
 && addgroup vmail postdrop \
 && install -d -o vmail -g vmail /srv/mail \
 && mkdir -p /var/opt/socket \
 && apk update \
 && apk upgrade \
 && apk add --no-cache ca-certificates \
 && update-ca-certificates \
 && apk add dovecot \
 && rm -rf /var/cache/apk/* /tmp/*

COPY entrypoint.sh /entrypoint.sh

EXPOSE 110 143

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/dovecot", "-F"]

