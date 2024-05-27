FROM alpine

MAINTAINER VooThanh DEV <voothanhdev@gmail.com>

COPY entrypoint /
COPY include/default.vcl /etc/varnish/default.vcl
COPY include/GeoLite2-Country.mmdb /etc/geoip/GeoLite2-Country.mmdb

RUN apk add --update varnish libmaxminddb && \
    sed -i -e 's/\r$//' /entrypoint && \
    chmod +x /entrypoint && \
    rm -rf /var/cache/apk/*

WORKDIR /etc/varnish

EXPOSE 6081 6082

VOLUME /etc/varnish/default.vcl

ENTRYPOINT ["/entrypoint"]
CMD ["varnishlog"]