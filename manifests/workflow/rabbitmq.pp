class ptero::workflow::rabbitmq {
  require ptero::params

  rabbitmq_vhost {$ptero::params::workflow::rabbitmq_vhost :
    ensure => present,
  }

  rabbitmq_user {$ptero::params::workflow::rabbitmq_username :
    password => $ptero::params::workflow::rabbitmq_password,
  }

  rabbitmq_user_permissions {$ptero::params::workflow::rabbitmq_full_user :
    configure_permission => '.*',
    read_permission      => '.*',
    write_permission     => '.*',
  }
}
