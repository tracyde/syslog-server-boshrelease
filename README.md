# Syslog Server BOSH Release

This is a BOSH release to create a production ready syslog endpoint. It currently uses [rsyslog](http://www.rsyslog.com/) which is pre-installed by the stemcell.


## Usage

Download the latest release from [bosh.io](https://bosh.io/releases/github.com/tracyde/syslog-server-release) and include it in your manifest:

```yml
releases:
- name: syslog-server
  version: latest
```

The [`syslog_server`](https://bosh.io/jobs/syslog_server?source=github.com/tracyde/syslog-server-release) is meant for testing. Deploy it and configure your instances to forward logs to it. It should not be co-located with other jobs which also try to configure syslog. Received logs are stored in `/var/vcap/store/syslog_server/syslog.log`.

```yml
instance_groups:
- name: syslog_server
  jobs:
  - name: syslog_server
    release: syslog-server
```

Remember to allow inbound traffic on TCP port 514 in your IaaS security groups.


## Tech Notes

RSYSLOG is system for log processing; it is a drop-in replacement for the UNIX's venerable [syslog](https://en.wikipedia.org/wiki/Syslog), which logs messages to various files and/or log hosts. RSYSLOG can be configured as a **storer** (i.e. it receives log messages from other hosts) or a **forwarder** (i.e. it forwards system log messages to RSYSLOG storers, syslog servers, or log aggregation services).

The RSYSLOG configuration file is `/etc/rsyslog.conf`. The RSYSLOG forwarder's customizations are rendered into `/etc/rsyslog.d/rsyslog.conf`, which is included by the configuration file.


## License

[Apache License Version 2.0](./LICENSE)
