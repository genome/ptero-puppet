class ptero {
  require ptero::params

  class {'python':
    dev        => true,
    gunicorn   => true,
    pip        => true,
    version    => 'system',
    virtualenv => true,
  }

  package {'git':
    ensure => present,
  }
}
