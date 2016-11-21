include 'apt'

include 'docker'

docker::image { 'nginx': }

class {'docker::compose': 
  ensure => present,
}
docker_compose { '/vagrant/local/docker/lb/docker-compose.yml':
  ensure  => present,
}

class { 'sudo':
  purge               => false,
  config_file_replace => false,
}  
  sudo::conf { 'vagrant':
  	priority => '10',
	content => '%vagrant ALL=(ALL) NOPASSWD: ALL',
}
  sudo::conf { 'admins':
	priority => '20',
	content  => "%admins ALL=(ALL) ALL",
}
