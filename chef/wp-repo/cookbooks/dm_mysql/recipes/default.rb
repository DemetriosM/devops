#
# Cookbook:: dm_mysql
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Load MySQL passwords from the 'passwords' data bag.
password = data_bag_item('dm_db', 'mysql', IO.read('/etc/chef/chef_secret_key').strip)

apt_update

# Configure the MySQL client.
mysql_client 'default' do
  action :create
end

# Configure the MySQL service.
mysql_service 'default' do
  port '3306'
  initial_root_password password['root_password']
  bind_address '0.0.0.0'
  action [:create, :start]
end

# Install the mysql2 Ruby gem.
mysql2_chef_gem 'default' do
  action :install
end

mysql_connection_info = {
  host:     '127.0.0.1',
  username: node['dm_db']['root_username'], 
  password: password['root_password']
}

# Create the database instance.
mysql_database node['dm_db']['dbname'] do
  connection mysql_connection_info
  action :create
end

# Add a database user.
mysql_database_user node['dm_db']['admin_username'] do
  connection     mysql_connection_info
  password       password['admin_password']
  database_name  node['dm_db']['dbname']
  host           '%' 
  action [:create, :grant]
end
