# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.box_check_update = false
  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  config.vm.synced_folder '.', '/app'

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '1024'
  end

  config.vm.provision 'shell', path: '.vagrant/system.sh',   privileged: true
  config.vm.provision 'shell', path: '.vagrant/ssh.sh',      privileged: true
  config.vm.provision 'shell', path: '.vagrant/redis.sh',    privileged: true
  config.vm.provision 'shell', path: '.vagrant/postgres.sh', privileged: true
  config.vm.provision 'shell', path: '.vagrant/nodejs.sh',   privileged: true
  config.vm.provision 'shell', path: '.vagrant/rvm.sh',      privileged: false
  config.vm.provision 'shell', path: '.vagrant/ruby.sh',     privileged: false
  config.vm.provision 'shell', path: '.vagrant/app.sh',      privileged: false
end
