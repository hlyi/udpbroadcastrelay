ARG ALPINE=alpine:3.12

FROM $ALPINE AS builder
WORKDIR /build
COPY main.c .
RUN apk add --no-cache gcc musl-dev linux-headers \
  && gcc -g main.c -o udpbroadcastrelay

FROM $ALPINE
WORKDIR /
COPY --from=builder --chmod=0755 /build/udpbroadcastrelay /
COPY --chmod=0755 start.sh /

ENTRYPOINT ["/start.sh"]
