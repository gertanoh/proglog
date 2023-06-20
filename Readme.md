# Distributed Services in Go

## Build a commit log

### HTTP Server using Json
an API with two endpoints, 
one to write and another to consume

### HTTP Server with gRPC

## Building a Log

- Record: the data stored in the log
- Store : the file we store records in
- Index : the fie we store index entries in
- Segment : the abstraction that ties a store and index together
- Log : the abstraction that ties all the segment together

Memory-mapped file can improve read/write times


## Write a log package
Create a log library

## Network
Create a service that people can access via network. People do not pay for library, but for services
Secure the services
- TLS to authentificate the server
- TLS mutual authentication, as 2-way auth is mostly common in machine-to-machine comm, i.e distributed systems

- For Authorization, use ACL

- use CFSSL to crete my own CA
- casbin for ACL

## Add observability
Metrics, logs and traces

# Distrubte

## Service discovery
using serf or consul or etcd or zookeeper
serf is simple and decentralized.
All instances of the server runs a serf node
## Data Replication
pull based vs push-based (raft, leader-follwer replication)
using grpc client, data is replicated
### Delivery
either run package or agent package