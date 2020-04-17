FROM golang:latest
RUN go get gopkg.in/EngineerBetter/stopover.v2 && mv /go/bin/stopover.v2 /go/bin/stopover
RUN go get github.com/mikefarah/yq/v3

FROM alpine:edge
RUN apk --no-cache add jq
COPY --from=0 /go/bin/stopover /go/bin/yq /usr/local/bin/
ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*
