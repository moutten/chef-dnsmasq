#
# Cookbook Name:: dnsmasq
# Recipe:: default
#
# Copyright (C) 2013 Matt Outten
#

package "dnsmasq"

service "dnsmasq" do
  action [:enable, :start]
end
