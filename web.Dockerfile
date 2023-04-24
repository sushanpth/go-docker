FROM golang:alpine

# gcc is required to build go apps 
RUN apk add build-base

# using inotify watchers to watch for the file changes
RUN apk add inotify-tools

COPY . /debug_env

WORKDIR /debug_env 

RUN go mod download

RUN go get github.com/go-delve/delve/cmd/dlv@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest

CMD sh /debug_env/run.sh 