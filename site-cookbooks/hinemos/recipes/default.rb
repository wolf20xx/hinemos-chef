#
# Cookbook Name:: hinemos
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
%w(readline.i686 net-snmp net-snmp-utils).each do |package|
  yum_package package do
      action :install
  end
end
include_recipe "hinemos::hinemos_server"
