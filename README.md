# DHCP ISC Smart Proxy Plugin / Static reservations

This plugin extends DHCP ISC Provider with a possibility to handle static DHCP reservations and __skip__ them!

## Motivation

A usual DHCP ISC Smart-proxy would always try to create(or delete) DHCP records and throw an exception, if static reservation exists.
So if you would like to reserve a record, putting into `dhcp.conf` something like:

```
  host node-1 {
     hardware ethernet 00:50:60:aa:bb:be;
     fixed-address 1.2.3.50;
     option host-name "node-1";
  }

```

it would not work at the end.. you would always see an exception like __Conflict!!__ :)

This plugin creates a __special case__ to handle a situation, if you __need__ to have static reservations in DHCP for some special hosts,
but still want to create and delete hosts with Foreman Proxy.

## How does it work

There is an additional option in `/etc/foreman-proxy/settings.d/dhcp_isc_res.yml`

```
:reserved: /etc/dhcp/reserved.conf
```

there you should put all your static reservations...

so create this file `/etc/dhcp/reserved.conf`, put reservations there __AND include it to dhcp.conf__

```
# /etc/dhcp/dhcpd.conf
include "/etc/dhcp/reserved.conf";
```

### Create/Delete host in Foreman

By creating a new host in Foreman you would __first see a conflict__ and a suggestion to __override__ host dhcp record. Confirm this.. Then by "override" the reserved host would be skipped. Same for the deletions.


# Installation

Currently only building from source is supported

Login to your Smart Proxy Node, clone this project and change to it

### Build and install gem

Smart proxy plugins are usual gems, so we need to build a gem and install it

```
gem build smart_proxy_dhcp_isc_res.gemspec # would generate some gem-file
gem install NAME_OF_GENERATED_FILE
```

### Make it visible to Foreman-Proxy

create `/usr/share/foreman-proxy/bundler.d/Gemfile.local.rb` and put in there:

```
gem 'smart_proxy_dhcp_isc_res'

```

## Configuration

To enable this DHCP provider, edit `/etc/foreman-proxy/settings.d/dhcp.yml` and set:

    :use_provider: dhcp_isc_res

Configuration options for this plugin are in `/etc/foreman-proxy/settings.d/dhcp_isc_res.yml`. Here is an example:

```
---
#
# Configuration file for ISC dhcp provider
#

#:ignore_exists: false

:config: /etc/dhcp/dhcpd.conf
:leases: /var/lib/dhcpd/dhcpd.leases
:reserved: /etc/dhcp/reserved.conf

:key_name: omapi_key
:key_secret: fggfgfg/OSTVsK3xDxtnJvCfgfgfgfgfgfgfgfgfgfgfcd+rR/TVX65DkuucPORIg==

:omapi_port: 7911

```

do not forget to update dhcp conf file

```
# /etc/dhcp/dhcpd.conf
include "/etc/dhcp/reserved.conf";
```
