# Prometheus Exporter for [Vultr](https://vultr.com)

> **NOTE** Currently only supports querying [Vultr Kubernetes Engine (VKE)](https://www.vultr.com/kubernetes/) clusters

[![build-container](https://github.com/DazWilkin/vultr-exporter/actions/workflows/build-container.yaml/badge.svg)](https://github.com/DazWilkin/vultr-exporter/actions/workflows/build-container.yaml)
[![Go Reference](https://pkg.go.dev/badge/github.com/DazWilkin/vultr-exporter.svg)](https://pkg.go.dev/github.com/DazWilkin/vultr-exporter)
[![Go Report Card](https://goreportcard.com/badge/github.com/dazwilkin/vultr-exporter)](https://goreportcard.com/report/github.com/dazwilkin/vultr-exporter)

## Image

+ `ghcr.io/dazwilkin/vultr-exporter:68ce72bb0e0dc271ea3d86c1368e6c279e10d940`

## API Key

The Exporter needs access to your Vultr API Key

```bash
export API_KEY="[YOUR-API-KEY]"
```

## Metrics

```bash
# HELP vultr_exporter_build_info A metric with a constant '1' value labeled by OS version, Go version, and the Git commit of the exporter
# TYPE vultr_exporter_build_info counter
vultr_exporter_build_info{git_commit="",go_version="go1.18",os_version=""} 1
# HELP vultr_exporter_start_time Exporter start time in Unix epoch seconds
# TYPE vultr_exporter_start_time gauge
vultr_exporter_start_time 1.653072239e+09
```

## Go

## Container

## Kubernetes

## Prometheus

## Alertmanager

## Sigstore

`vultr-exporter` container images are being signed by Sigstore and may be verified:

```bash
cosign verify \
--key=./cosign.pub \
ghcr.io/dazwilkin/vultr-exporter:68ce72bb0e0dc271ea3d86c1368e6c279e10d940
```

> **NOTE** cosign.pub may be downloaded [here](/cosign.pub)

To install cosign, e.g.:

```bash
go install github.com/sigstore/cosign/cmd/cosign@latest
```
