ARG GOLANG_VERSION=1.18
ARG GOLANG_OPTIONS="CGO_ENABLED=0 GOOS=linux GOARCH=amd64"

FROM docker.io/golang:${GOLANG_VERSION} as build

WORKDIR /vultr-exporter

ARG COMMIT=""
ARG VERSION=""

COPY go.mod go.mod
COPY go.sum go.sum

RUN go mod download

COPY cmd/server cmd/server
COPY collector collector

RUN env ${GOLANG_OPTIONS} \
    go build \
    -ldflags "-X main.OSVersion=${VERSION} -X main.GitCommit=${COMMIT}" \
    -a -installsuffix cgo \
    -o /bin/server \
    ./cmd/server


FROM gcr.io/distroless/base-debian11

LABEL org.opencontainers.image.source https://github.com/DazWilkin/vultr-exporter

COPY --from=build /bin/server /

ENTRYPOINT ["/server"]
CMD ["--entrypoint=0.0.0.0:8080","--path=/metrics"]
