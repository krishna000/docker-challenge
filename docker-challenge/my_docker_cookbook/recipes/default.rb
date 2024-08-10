#
# Cookbook:: my_docker_cookbook
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.
# Install Docker
package 'docker.io' do
  action :install
end

service 'docker' do
  action [:enable, :start]
end

# Build and run the first container
docker_image 'first_container' do
  tag 'latest'
  source 'docker/first_container'
end

docker_container 'first_container' do
  image 'first_container:latest'
  port '80:80'
  action :run
end

# Build and run the second container
docker_image 'second_container' do
  tag 'latest'
  source 'docker/second_container'
end

docker_container 'second_container' do
  image 'second_container:latest'
  port '5000:5000'
  action :run
end


