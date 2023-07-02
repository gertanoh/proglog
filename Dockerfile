FROM golang:1.20-alpine AS build
WORKDIR /go/src/prolog
COPY . .
RUN CGO_ENABLED=0 go build -o /go/bin/prolog ./cmd/prolog

FROM scratch
COPY --from=build /go/bin/prolog /bin/prolog
ENTRYPOINT ["/bin/prolog"]