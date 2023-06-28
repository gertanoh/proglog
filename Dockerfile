FROM golang:1.20-alpine AS build
WORKDIR /go/src/prolog
COPY . .
RUN CGO_ENABLED=0 go build -o /go/bin/prolog ./cmd/prolog

RUN GRPC_HEALTH_PROBE_VERSION=v0.4.19 && \
    wget -qO/bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
    chmod +x /bin/grpc_health_probe

FROM scratch
COPY --from=build /go/bin/prolog /bin/prolog
ENTRYPOINT ["/bin/prolog"]