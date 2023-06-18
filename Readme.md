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
