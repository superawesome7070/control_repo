class profile::app {
  file {'/root/README':
    ensure  => file,
    content => 'This is a README',
    owner   => 'root',
    }
}
