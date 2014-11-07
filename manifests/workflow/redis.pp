class ptero::workflow::redis {
  require ptero::params

  redis::instance {'workflow-redis':
    redis_port         => $ptero::params::workflow::redis_port,
    redis_bind_address => '0.0.0.0',
    redis_password     => $ptero::params::workflow::redis_password,
  }
}
