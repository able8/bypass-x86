FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add --update bash iptables ipset && \
    rm -rf /var/cache/apk/*

ADD init ./
ADD clean-rule ./

ENTRYPOINT ./init
