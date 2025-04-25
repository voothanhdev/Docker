FROM alpine

LABEL maintainer="<voothanhdev@gmail.com>"
LABEL author.email="<voothanhdev@gmail.com>"
LABEL author.name="VooThanh DEV"

COPY entrypoint /
COPY include/default.vcl /etc/varnish/default.vcl
COPY include/GeoLite2-Country.mmdb /etc/geoip/GeoLite2-Country.mmdb

RUN apk add --update varnish libmaxminddb && \
    chmod +x /entrypoint && \
    rm -rf /var/cache/apk/*

WORKDIR /etc/varnish

EXPOSE 6081 6082

VOLUME /etc/varnish/default.vcl

ENTRYPOINT ["/entrypoint"]
CMD ["varnishlog"]