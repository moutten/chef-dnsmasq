#
# Cookbook Name:: dnsmasq
# Recipe:: default
#
# Copyright (C) 2013 Matt Outten
#

include_recipe "dnsmasq::dns"

Chef::Log.info node['dnsmasq']['dhcp']['dhcp_range']

template "/etc/dnsmasq.d/dhcp.conf" do
  owner "dnsmasq"
  variables(
    :domain => node['dnsmasq']['domain'],
    :conf   => node['dnsmasq']['dhcp']
  )
  notifies :restart, "service[dnsmasq]"
end
