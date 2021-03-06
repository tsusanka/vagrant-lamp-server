#
# Cookbook Name:: apache2
# Definition:: apache_site
#
# Copyright 2008-2013, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

define :apache_site, :enable => true do
  include_recipe 'apache2::default'

  if params[:enable]
    execute "a2ensite #{params[:name]}" do
      command "/usr/sbin/a2ensite #{params[:name]}"
      notifies :reload, 'service[apache2]', :delayed
      not_if do
        ::File.symlink?("#{node['apache']['dir']}/sites-enabled/#{params[:name]}") ||
        ::File.symlink?("#{node['apache']['dir']}/sites-enabled/000-#{params[:name]}") ||
        ::File.symlink?("#{node['apache']['dir']}/sites-enabled/#{params[:name]}.conf") ||
        ::File.symlink?("#{node['apache']['dir']}/sites-enabled/000-#{params[:name]}.conf")
      end
      only_if { ::File.exist?("#{node['apache']['dir']}/sites-available/#{params[:name]}.conf") }
    end
  else
    execute "a2dissite #{params[:name]}" do
      command "/usr/sbin/a2dissite #{params[:name]}"
      notifies :reload, 'service[apache2]', :delayed
      only_if do
        ::File.symlink?("#{node['apache']['dir']}/sites-enabled/#{params[:name]}") ||
        ::File.symlink?("#{node['apache']['dir']}/sites-enabled/000-#{params[:name]}") ||
        ::File.symlink?("#{node['apache']['dir']}/sites-enabled/#{params[:name]}.conf") ||
        ::File.symlink?("#{node['apache']['dir']}/sites-enabled/000-#{params[:name]}.conf")
      end
    end
  end
end
