#
# Cookbook Name:: serverdensity
# Recipe:: install
#
# Copyright 2012, Escape Studios
#

case node[:platform]
	when "debian", "ubuntu"
		#trust the Server Density GPG Key
		#this step is required to tell apt that you trust the integrity of Server Density's apt repository
		gpg_key_id = node[:serverdensity][:repository_key]

		if gpg_key_id
			gpg_key_url = "https://www.serverdensity.com/downloads/#{gpg_key_id}.key"

			gpg_key_already_installed = "apt-key list | grep #{gpg_key_id}"

			if gpg_key_url
				execute "serverdensity-add-gpg-key" do
					command "wget -O - #{gpg_key_url} | apt-key add -"
					notifies :run, "execute[serverdensity-apt-get-update]", :immediately
					not_if gpg_key_already_installed
				end
			end
		end

		#configure the Server Density apt repository
		local_file = "/etc/apt/sources.list.d/sd-agent.list"

    cookbook_file "#{local_file}" do
			owner "root"
			group "root"
			mode 0644
			notifies :run, "execute[serverdensity-apt-get-update]", :immediately
			action :create_if_missing
    end

		#update the local package list
		execute "serverdensity-apt-get-update" do
			command "apt-get update"
			action :nothing
		end
	when "redhat", "centos", "fedora"
		#install the sd-agent package, which configures a new package repository for yum
		if node[:kernel][:machine] == "x86_64"
			machine = "x86_64"
		else
			machine = "i386"
		end

    local_file = "/etc/yum.repos.d/serverdensity.repo"

    cookbook_file "#{local_file}" do
			owner "root"
			group "root"
			mode 0644
			action :create_if_missing
    end

		package "sd-agent" do
			action :install
		end
end
