FROM voidlinux/voidlinux:latest

RUN xbps-install -Syy git make
RUN xbps-install -Syy gcc
RUN xbps-install -Syy go

ENV PATH="/go/bin:${PATH}"
ENV GOPATH="/go"
WORKDIR /go

RUN go get -u github.com/golang/dep/cmd/dep
RUN go get -u github.com/axw/gocov/gocov
RUN go get -u github.com/alecthomas/gometalinter
RUN gometalinter --install
