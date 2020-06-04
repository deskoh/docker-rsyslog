# rsyslog Centralized Log Server

`rsyslog` centralized log server that outputs to `stdout`. Docker image is based on [Red Hat Universal Base Image](https://developers.redhat.com/products/rhel/ubi/).

## QuickStart

```sh
# Build and run docker image
docker build . -t rsyslog
docker run --rm -it -p 514:514 -p 514:514/udp rsyslog

# Test UDP logging
logger --server 127.0.0.1 --udp --port 514 "Log from UDP"
# Test TCP logging
logger --server 127.0.0.1 --tcp --port 514 "Log from TCP"
```
