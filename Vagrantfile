

domain   = 'example.com'
box = 'jessie64'
nodes = [{ :hostname => 'default', :ip => '192.168.0.40', :box => box },
     { :hostname => 'slave41', :ip => '192.168.0.41', :box => box },
 #   { :hostname => 'slave42', :ip => '192.168.0.42', :box => box },
 #   { :hostname => 'slave43', :ip => '192.168.0.43', :box => 'precise32' },
 #   { :hostname => 'slave44', :ip => '192.168.0.44', :box => 'precise32' },
 #   { :hostname => 'slave45', :ip => '192.168.0.45', :box => 'precise32' },
 #   { :hostname => 'slave46', :ip => '192.168.0.46', :box => 'precise32' },
 #   { :hostname => 'slave47', :ip => '192.168.0.47', :box => 'precise32' },
 #   { :hostname => 'slave48', :ip => '192.168.0.48', :box => 'precise32' },
]

puts "Configuration"

Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = node[:box]
      nodeconfig.vm.hostname = node[:hostname] + ".box"
      nodeconfig.vm.network :private_network, ip: node[:ip] # configurar xarxa interna

      memory = node[:ram] ? node[:ram] : 256;
      nodeconfig.vm.provider :virtualbox do |vb|
        vb.customize [
                         "modifyvm", :id,
                         "--cpuexecutioncap", "50",
                         "--memory", memory.to_s,
                     ]
      end
    end
  end

  config.vm.provision :shell do |shell|
    shell.inline = "mkdir -p /etc/puppet/modules
      puppet module install puppetlabs/nodejs;
      puppet module install puppetlabs/apache;
      puppet module install puppetlabs/vcsrepo"
  end


  config.vm.provision :puppet do |puppet|
    puppet.options = "--verbose --debug"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "init.pp"
    puppet.module_path = "puppet/modules"
  end

  config.vm.provision "shell", path: "puppet/scripts/bootstrap"



end

puts "End Configuration"