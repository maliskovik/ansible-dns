# Bind
Manages multiple DNS servers.
Supported:
* Redhat - based distros
* Debian based distros

## Variables
Variables come in a couple of big structures:

### Defaults
Default - mostly used as global defaults, mostly for the SOA record

* dns_defaults: object
  - ttl: <default ttl> - can be overriden per zones or records.
  - nameservers: List of nameservers - first one is used as default in SOA record.
  - email: < Admin mail > for SOA record
  - refresh: < refresh > for SOA record
  - retry: < retry > for SOA record
  - expire: < expire > for SOA record
  - default_ttl: < default > for SOA record - not to be confused with previous ttl

### Options
Options config file of the server.
* dns_options: object
  - version: < Version string > - string to be displayed as version
  - allow_recursion: List of zones to allow recursion on
  - allow_transfer: List of zones to allow transfer
  - allow_query: list of hosts toallow query from (e.g. "all )
  - forwarders: list of forwarders
  - listen_on: List of addresses to listen on ("all")
  - listen_on_v6: List of IPv6 addresses to listen on ("all")
  - query_source_port: Port to listen on
  - query_source_address: address to listen on
  - max_recursive_clients:
  - max_tcp_clients:
  - max_cache_size: max cache size in bytes
  - dnssec_validation: recommended: auto"
  - auth_nxdomain: "no"

### ACL
* dns_acl: List of ACLs
  - name: name of ssecurity zone
  - addresses: List of addresses in the zone

### Zones
* dns_zones:
  - forwarders: List of forwarder zones
    - name: name of the zone
    - forwarders: List of forwarders
  - masters: List of master zones
    - name: Name of the zone
    - serial: Serial - must be incremented every time you make a change to a zone.
    - a_records: List of A records
      - name: Name of subdomain. Can be omitted, to use zonename.
      - target: IP address to poit to
      - ttl: TTL (optional)
      - class: record class (optional), defaults to "IN"
    - cname_records: List of CNAME records
      - name: Name of subdomain.
      - target: (optional) domain to point to. Can be omited to used zone as target.
      - ttl: TTL (optional)
      - class: record class (optional), defaults to "IN"
    - txt_records: List of TXT records
      - name: Name of subdomain. Can be omitted, to use zonename.
      - text: record value
      - ttl: TTL (optional)
      - class: record class (optional), defaults to "IN"
    - mx_records: List of MX records
      - name: Name of subdomain. Can be omitted, to use zonename.
      - priority: priority
      - target: (optional) domain to point to.
      - ttl: TTL (optional)
      - class: record class (optional), defaults to "IN"
    - ns_records: List of ns servers.

### Blacklist

* dns_blackilist: List of blacklist zones
  - name: name of the zone
  - serial: serial
  - type: zone type (master)
  - file: hosts file
  - a_records... same as in dns_zones

## TODO
- auto serial increment
