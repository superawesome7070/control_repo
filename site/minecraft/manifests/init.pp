class minecraft {
$url = 'https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar'
$install_dir = '/opt/minecraft'
  file {"${install_dir}/opt/minecraft":
    ensure => directory,
 }
 file {'/server.jar':
    ensure => file,
    source => $url,
    before => Service['minecraft'],
 }
 package {'java':
    ensure => present,
  }
  
  file {'/opt/minecraft/eula.txt':
      ensure => file,
      content => 'eula=true',
   }
  file {'/etc/systemd/system/minecraft.service':
      ensure => file,
      source => 'puppet:///modules/minecraft/minecraft.service',
 }
 
 service {'minecraft':
  ensure => running,
  enable => true,
  require => [Package['java'],File['/opt/minecraft/eula.txt'],File['/etc/systemd/system/minecraft.service']],
}
 

}
