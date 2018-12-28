FROM alpine:3.4
MAINTAINER Magnus Ullberg <magnus@ullberg.us>

RUN apk add --no-cache postfix rsyslog supervisor ca-certificates && \
    /usr/bin/newaliases && \
    postconf 'smtp_sasl_auth_enable = yes' && \
    postconf 'smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd' && \
    postconf 'smtp_sasl_auth_enable = yes' && \
    postconf 'smtp_sasl_security_options = noanonymous' && \
    postconf 'smtp_use_tls = yes' && \
    postconf 'smtp_tls_security_level = encrypt' && \
    postconf 'smtp_tls_note_starttls_offer = yes' && \
    postconf 'smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt' && \
    postconf 'mynetworks = 10.0.0.0/8,127.0.0.0/8,172.16.0.0/12' && \
    postconf 'smtputf8_enable = no' && \
    postconf 'always_add_missing_headers = yes' && \
    echo '/.*@localdomain/ DISCARD' > /etc/postfix/header_checks && \
    postconf 'header_checks = regexp:/etc/postfix/header_checks'

COPY overlay /

EXPOSE 25

ENTRYPOINT [ "/smtp-relay.sh" ]
