# opensmtpd-alpine

## Description
OpenBSD's fantastic opensmtpd, based on the alpine:3.7 container.

## Defaults
1. executes ```smtpd``` with ```-dv``` flags by default, can be overridden as shown below
1. looks for configuration in ```/etc/smtpd/smtpd.conf```
1. config location symlinked to ```/etc/opensmtpd``` for convenience/compatibility with other systems
1. queue data volume and work directory both default to ```/var/spool/smtpd```

## Usage Examples

```
# obtain help message
docker run -it --rm dhylton/openbsd-alpine -h

# run config test
docker run -it --rm dhylton/openbsd-alpine -n

# provide pre-execution commands and own configuration
docker run -d -v cmdlist.sh:/precmd -v myconfig.conf:/etc/smtpd/smtpd.conf --name mymailserver dhylton/openbsd-alpine

# view queue, stats, and other things for running container
docker exec -it mymailserver smtpctl show queue
docker exec -it mymailserver smtpctl show status
docker exec -it mymailserver smtpctl show stats
docker exec -it mymailserver smtpctl stop
```
