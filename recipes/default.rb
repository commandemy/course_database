#
# Cookbook Name:: course_database
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

# 1 Install MySQL Server
include_recipe 'mysql::server'

# 2 Create a database user for our app
include_recipe 'database::mysql'

mysql_connection_info = {
  :host => node['database']['host'],
  :username => node['database']['root'],
  :password => node['mysql']['server_root_password']
}

mysql_database_user node['database']['username'] do
  connection mysql_connection_info
  password node['database']['password']
  host node['database']['host']
  action [:create, :grant]
end

# 3 Create a database for user
mysql_database node['database']['dbname'] do
  connection mysql_connection_info
  owner node['database']['username']
  action :create
end

# 4 Assign User to DB
mysql_database_user node['database']['username'] do
  connection      mysql_connection_info
  password        node['database']['password']
  database_name   node['database']['dbname']
  privileges      [:select, :update, :insert]
  action          [:grant]
end
