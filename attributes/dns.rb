###########################################################
# DNS
###########################################################
# Never forward plain names (without a dot or domain part)
default['dnsmasq']['dns']['domain-needed'] = true

# Never forward addresses in the non-routed address spaces.
default['dnsmasq']['dns']['bogus-priv'] = true

# Set this if you want to have a domain
# automatically added to simple names in a hosts-file.
default['dnsmasq']['dns']['expand-hosts'] = true

# An array of the IP addresses to forward DNS requests
# to. For instance, for Google public DNS use:
#
# [
#   '8.8.8.8',
#   '8.8.4.4'
# ]
default['dnsmasq']['dns']['nameservers'] = nil

# This should be an array of hashes with the domain as
# the key and the ip as the value. For example:
#
# {
#   "test1.com" => "10.0.0.1",
#   "test2.com" => "10.0.0.2"
# }
#
default['dnsmasq']['dns']['hosts'] = nil
