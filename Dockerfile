FROM golang:rc-alpine as go_builder

WORKDIR /go/src

COPY . /go/src/

RUN go build main.go

FROM scratch

WORKDIR /go/src
COPY --from=go_builder /go/src/ .

CMD ["./main"]