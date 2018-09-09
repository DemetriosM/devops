#
# Cookbook:: dm_apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

packages = data_bag_item('dm_db', 'mysql', IO.read('/etc/chef/chef_secret_key').strip)

apt_update

packages['packages'].each do |pack|
  package "#{pack}" do
    action :install
  end
end

remote_file "/tmp/wordpress.tar.gz" do
  action :create_if_missing
  owner 'root'
  mode '0644'
  source "https://wordpress.org/latest.tar.gz"
end

execute 'untar' do
  cwd '/tmp/'
  command "tar xzf wordpress.tar.gz -C /var/www/"
  action :run
  not_if { ::Dir.exist?("/var/www/wordpress") }
end

ruby_block 'replace_line' do
  block do
   file = Chef::Util::FileEdit.new('/etc/apache2/sites-enabled/000-default.conf')
   file.search_file_replace_line(/DocumentRoot.*/, "\tDocumentRoot /var/www/wordpress")
   file.write_file
  end
  only_if { File.exist?('/etc/apache2/sites-enabled/000-default.conf') }
end

service "apache2" do
  action :restart
end

template '/var/www/wordpress/wp-config.php' do
  source 'wp-config.php.erb'
  action 'create'
  variables(
    :db_name     => node['dm_wordpress']['db_name'],
    :db_user     => node['dm_wordpress']['db_username'],
    :db_ip       => node['dm_wordpress']['db_ip'],
    :db_password => packages['admin_password']
  )
end

execute 'priv' do
  command 'chown -R www-data:www-data /var/www/wordpress && chmod -R u=rwX,g=rwX,o=rX /var/www/wordpress'
  action :run
end
