
 
# 
node 'default' {
	package {['vim' , 'git', 'sudo'] : ensure => present } 

	vcsrepo { '/tmp':
	  ensure   => present,
	  provider => git,
	  source   => 'https://github.com/2XL/doFoo.git',
	}
}


# install this to each slave node...
node /^slave\d+/ {
	package {['vim' , 'git'] : ensure => present } 

  vcsrepo { '/tmp':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/2XL/doFoo.git',
  }

}

