class ptero::shell_command::redis {
  require ptero::params

  redis::instance {'sc-redis':
    redis_port         => $ptero::params::shell_command::redis_port,
    redis_bind_address => '0.0.0.0',
    redis_password     => $ptero::params::shell_command::redis_password,
  }
}
