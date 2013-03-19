#
# Cookbook Name:: dnsmasq
# Recipe:: dns
#
# Copyright (C) 2013 Matt Outten
#

include_recipe "dnsmasq"

template "/etc/dnsmasq.d/dns.conf" do
  owner "dnsmasq"
  variables(
    :domain => node['dnsmasq']['domain'],
    :conf   => node['dnsmasq']['dns']
  )
  notifies :restart, "service[dnsmasq]"
end

template "/etc/resolv_dnsmasq.conf" do
  owner "dnsmasq"
  variables(
    :domain => node['dnsmasq']['domain'],
    :conf   => node['dnsmasq']['dns']
  )
  only_if { node['dnsmasq']['dns']['nameservers'] }
  notifies :restart, "service[dnsmasq]"
end

template "/etc/hosts_dnsmasq" do
  owner "dnsmasq"
  variables(
    :hosts => node['dnsmasq']['dns']['hosts']
  )
  only_if { node['dnsmasq']['dns']['hosts'] }
  notifies :restart, "service[dnsmasq]"
end

