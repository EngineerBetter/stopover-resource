FROM golang:latest
RUN go get gopkg.in/EngineerBetter/stopover.v2 && mv /go/bin/stopover.v2 /go/bin/stopover

FROM alpine:edge
RUN apk --no-cache add jq yq
COPY --from=0 /go/bin/stopover /usr/local/bin
ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*
