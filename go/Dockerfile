from alpine:edge as bootstrap

run apk --no-cache add musl-dev gcc git bash

workdir /
run git clone https://go.googlesource.com/go
run cp -r go go1.4

workdir /go1.4/src
run git checkout release-branch.go1.4
env CGO_ENABLED=0
run ./make.bash

workdir /go/src
run git checkout go1.12
env GOROOT_BOOTSTRAP=/go1.4
run ./make.bash

run /go/bin/go clean -i std
run rm -rf /go/.git /go/pkg/obj/go-build /go/pkg/bootstrap


from alpine:edge as go

copy --from=bootstrap /go /opt/go

env GOROOT=/opt/go GOPATH=/go CGO_ENABLED=0
env PATH=/go/bin:/opt/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

run apk --no-cache add git


from go as tools

run go get github.com/MYOB-Technology/hubr


from go

copy --from=tools /go/bin /go/bin

