class ptero::petri::redis {
  require ptero::params

  redis::instance {'petri-celery-redis':
    redis_port         => $ptero::params::petri::redis_celery_port,
    redis_bind_address => '0.0.0.0',
    redis_password     => $ptero::params::petri::redis_celery_password,
  }

  redis::instance {'petri-redis':
    redis_port         => $ptero::params::petri::redis_port,
    redis_bind_address => '0.0.0.0',
    redis_password     => $ptero::params::petri::redis_password,
  }
}
