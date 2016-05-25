FROM golang:latest
MAINTAINER Barak Michener <barak.michener@coreos.com>

# Set up workdir
WORKDIR /go/src/github.com/coreos/agro

# Add and install agro
ADD . .
RUN go get -d ./...
RUN go install -v github.com/coreos/agro/cmd/agro
RUN go install -v github.com/coreos/agro/cmd/agroctl
RUN go install -v github.com/coreos/agro/cmd/agroblock

# Expose the port and volume for configuration and data persistence.
VOLUME ["/data", "/plugin"]
EXPOSE 40000 4321

CMD ["./entrypoint.sh"]
