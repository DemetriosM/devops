#
# Cookbook:: dm_wordpress
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

passwords = data_bag_item('dm_db', 'mysql', IO.read('/etc/chef/chef_secret_key').strip)

remote_file "/tmp/wordpress.tar.gz" do
  owner  'root'
  mode   '0644'
  source "https://wordpress.org/latest.tar.gz"
  action :create_if_missing
end

execute 'untar' do
  cwd     '/tmp/'
  command "tar xzf wordpress.tar.gz -C /var/www/"
  action  :run
  not_if  { File.exist?("/var/www/wordpress/index.php") }
end

template '/var/www/wordpress/wp-config.php' do
  source 'wp-config.php.erb'
  action 'create'
  variables(
    :db_name     => node['dm_wordpress']['dbname'],
    :db_user     => node['dm_wordpress']['admin_username'],
    :db_password => passwords['admin_password'],
    :db_ip       => node['dm_wordpress']['db_ip']
  )
end
