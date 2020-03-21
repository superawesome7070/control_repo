class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service { 'sshd':
          ensure => 'running',
          enable => 'true',
  }
  ssh_authorized_key { 'root@master.puppet.vm':
            ensure => present,
            user => 'root,
            type => 'ssh-rsa',
            key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDBfbtubYPRb48s2KSS8VcZiFYG8dUMsEeLC8JZRqmVARx192DDCyvr648Lp3nKkQE7CKtGCYet1H5Jfhf+2yCSsfsa0sRT+hlY/BNsXgyEyFqb4XjeSSvIWuRIGDB/1dwRJnmeUYDdVdiFTWuWKCjjGDqCPql/HUOFwn6+TMgi8E57a7X6cAGAJac7lUa38bqlAlDbuiVRAASLL24n8f97GKqyTNntZI38BFvT08Q3tSXDoVnXKwGumpy2NzIo9eq0VVa2xsqhFcUv2DLE7vDOch1/tqo3C4HIU3/dXG3aCg7QaTsrF9NErjK95hJ52s9nWAfNr6DTavYEc9lIQtVr',
  }
}
