FROM golang:1.20-alpine AS build
WORKDIR /go/src/prolog
COPY . .
RUN CGO_ENABLED=0 go build -o /go/bin/prolog ./cmd/prolog

RUN wget -qO/go/bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/v0.4.19/grpc_health_probe-linux-amd64 && \
    chmod +x /go/bin/grpc_health_probe

FROM scratch
COPY --from=build /go/bin/prolog /bin/prolog
COPY --from=build /go/bin/grpc_health_probe /bin/grpc_health_probe
ENTRYPOINT ["/bin/prolog"]