FROM golang:alpine AS builder

ENV GOPATH=/go \
    GO111MODULE=on \
    CGO_ENABLED=0

RUN go install github.com/mailhog/MailHog@latest

FROM alpine

RUN adduser -D -u 1000 mailhog

COPY --from=builder /go/bin/MailHog /usr/local/bin/MailHog

USER mailhog
WORKDIR /home/mailhog

EXPOSE 1025 8025
ENTRYPOINT ["MailHog"]
