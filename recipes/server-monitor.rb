#
# Cookbook Name:: serverdensity
# Recipe:: server-monitor
#
# Copyright 2012, Escape Studios
#

#install the server monitor
package "sd-agent" do
	action :install
end

#configure your Server Density agent key
template "/etc/sd-agent/config.cfg" do
	source "config.cfg.erb"
	owner "root"
	group "root"
	mode "640"
	variables(
		:sd_url => node[:serverdensity][:sd_url],
		:agent_key => node[:serverdensity][:agent_key]
	)
	notifies :restart, "service[sd-agent]"
end

service "sd-agent" do
  supports :start => true, :stop => true, :restart => true
	action [:enable, :start] #starts the service if it's not running and enables it to start at system boot time
end
