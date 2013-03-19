# dnsmasq cookbook
---

## Requirements

### Platform:

Tested on:

Ubuntu 12.04

## Usage

## Attributes

### General

* `default['dnsmasq']['domain']` - The default domain used when
  resolving domains names, as well as for DHCP clients.

### DHCP

* `default['dnsmasq']['dhcp']['dhcp_range']` - The DHCP range to be used
  by the dhcp server. This includes the TTL value at the end of the
  range in a standard dnsmasq config.  For example:

```
    # Assigns clients IPs from 192.168.0.50 - 192.168.0.150 with a 12
    # hour lease expiration.
    192.168.0.50,192.168.0.150,12h
```

* `default['dnsmasq']['dhcp']['dhcp_hosts']` - An array of static hosts
  to be assign specific IP address via DHCP. For example:

```ruby
    # This will assign the IP 192.168.0.20 to the network adapter wit
    # the MAC address `11:22:33:44:55:66`.
    [
      "11:22:33:44:55:66,192.168.0.60"
    ]
```

* `default['dnsmasq']['dhcp']['default_route']` - This is the default
  route to use for all DHCP clients. This defaults to the IP where the
  DHCP server is running.

### DNS

* `default['dnsmasq']['dns']['domain-needed']` - Never forward plain 
  names (without a dot or domain part)

* `default['dnsmasq']['dns']['bogus-priv']` - Never forward addresses
  in the non-routed address spaces.

* `default['dnsmasq']['dns']['expand-hosts']` - Set this if you want to have a domain
  automatically added to simple names in a hosts-file.

* `default['dnsmasq']['dns']['nameservers']` - An array of the IP 
  addresses to forward DNS requests to. For instance, for Google 
  public DNS use:

```ruby
    [
      '8.8.8.8',
      '8.8.4.4'
    ]
```

* `default['dnsmasq']['dns']['hosts']` - This should be an array of 
  hashes with the domain as the key and the ip as the value. For 
  example:

```ruby
    {
      "test1.com" => "10.0.0.1",
      "test2.com" => "10.0.0.2"
    }
```
## Recipes

### default

Installs dnsmasq package and defines service.

### dhcp

Configures dnsmasq as a DHCP server.

### dns

Configures dnsmasq as a DNS cache server.

## Author

Author:: Matt Outten (matt@outten.net)
