


notify { "Install Packages": }

package { ['vim', 'git']: ensure=>present }
