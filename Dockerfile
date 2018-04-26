FROM alpine:3.7

RUN apk add --no-cache opensmtpd \
    && mkdir -p /var/spool/smtpd \
    && ln -s /etc/smtpd /etc/opensmtpd \
    && chmod 0711 /var/spool/smtpd \
    && sed -e 's/localhost/127.0.0.1/g' < /etc/smtpd/smtpd.conf > /etc/smtpd/smtpd.conf.2 \
    && mv /etc/smtpd/smtpd.conf.2 /etc/smtpd/smtpd.conf

VOLUME /var/spool/smtpd
WORKDIR /var/spool/smtpd

EXPOSE 25

CMD ["smtpd", "-dv"]
