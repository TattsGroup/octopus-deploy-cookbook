#
# Author:: Brent Montague (<bmontague@cvent.com>)
# Cookbook Name:: octopus-deploy-test
# Recipe:: server
#
# Copyright:: Copyright (c) 2015 Cvent, Inc.
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

# Just make sure its not installed already
octopus_deploy_tattsgroup_server 'OctopusServer' do
  action :remove
  version node['octopus-deploy-test']['server']['version']
end

octopus_deploy_tattsgroup_server 'OctopusServer' do
  action :configure
  version node['octopus-deploy-test']['server']['version']
  checksum node['octopus-deploy-test']['server']['checksum']
  node_name 'octo-web-01'
  connection_string 'Data Source=localhostdba;Initial Catalog=octo;Integrated Security=False;User ID=octo;Password=password'
  start_service false
  master_key node['octopus-deploy-test']['server']['master-key']
end
