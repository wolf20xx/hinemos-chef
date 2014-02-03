#
# Cookbook Name:: hinemos
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
#
install_dir = '/usr/local/src'

log '[hinemos::hinemos_manager]fetch hinemos_manager package'
remote_file "/tmp/hinemos.tar.gz" do
      source 'http://sourceforge.jp/frs/redir.php?m=jaist&f=%2Fhinemos%2F60378%2Fhinemos_manager-4.1.1_rhel6_64.tar.gz'
end

log '[hinemos::hinemos_manager]install hinemos_manager'
bash 'install_hinemos' do
  user 'root'
  code <<-EOL
    install -d #{install_dir}
    tar xfz /tmp/hinemos.tar.gz -C #{install_dir}
    cd #{install_dir}/Hinemos_Manager-4.1.1_rhel6_64
    ./manager_installer_JP.sh
  EOL
end

log '[hinemos::hinemos_manager]regist hinemos daemon'
bash 'regist_daemon_hinemos' do
  user 'root'
  code <<-EOL
    cp /opt/hinemos/sbin/service/hinemos_manager /etc/init.d/
  EOL
end

log '[hinemos::hinemos_manager]set hinemos daemon'
execute 'set hinemos daemon' do
  command 'chkconfig --add hinemos_manager'
  action :run
end

log '[hinemos::hinemos_manager]start hinemos daemon'
if File.exists?('/etc/init.d/hinemos_manager') 
  service 'hinemos_manager' do
    provider Chef::Provider::Service::Init::Redhat
    supports :start => true, :restart => true, :reload => true, :stop => true
    action :start
  end
end
