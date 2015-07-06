 
stage { 'first':
    before => Stage['main'];
}

class prepare {
    class { 'apt':
      update => {
        frequency => 'always',
      },
    }
    class { 'python' :
      version    => 'system',
      pip        => true,
      dev        => true,
      virtualenv => true,
      gunicorn   => true,
    }
}
class { 'prepare':
    stage => first;
}

stage { 'first':
    before => Stage['main'];
}

class prepare {
    class { 'apt':
      update => {
        frequency => 'always',
      },
    }
    class { 'python' :
      version    => 'system',
      pip        => true,
      dev        => true,
      virtualenv => true,
      gunicorn   => true,
    }
}
class { 'prepare':
    stage => first;
}


# 
node 'default' {
	package {['vim' , 'git', 'sudo'] : ensure => present } 
}


# install this to each slave node...
node /^slave\d+/ {
	package {['vim' , 'git'] : ensure => present } 



}

