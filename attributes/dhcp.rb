###########################################################
# DHCP
###########################################################

# dnsmasq format (ex: 192.168.0.50,192.168.0.150,12h)
default['dnsmasq']['dhcp']['dhcp_range'] = ''

# An array of static hosts to be assigned
# specific IP addresses via DHCP. This uses the
# dnsmasq format for dhcp_hosts. For example:
# [
#  "11:22:33:44:55:66,192.168.0.60"
# ]
#
default['dnsmasq']['dhcp']['dhcp_hosts'] = []

# The default route provided by the DHCP server. This defaults
# to the machine running dnsmasq.
default['dnsmasq']['dhcp']['default_route'] = nil

# An array of hashes that represent the tags used to
# in conjunction with certain dhcp options. For
# instances, the following will set a tag to machines with
# the mac address specified, and assign those machines a
# different default route.
# [
#   {
#     :tag_name => "alternate_internet",
#     :dhcp_hosts => [
#       "11:22:33:44:55:66,192.168.0.70"
#     ],
#     :dhcp_range => "192.168.0.100,192.168.0.150,12h",
#     :mac_addresses => [
#       "00:60:8C:*:*:*"
#     ],
#     :route => "192.168.0.2"
#   }
# ]
default['dnsmasq']['dhcp']['tags'] = []
