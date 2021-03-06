class ptero::petri::web {
  require ptero::params

  ptero::web{'petri':
    code_dir    => $ptero::params::petri::target_directory,
    source      => $ptero::params::petri::repo,
    revision    => $ptero::params::petri::tag,
    host        => $ptero::params::petri::host,
    listen_port => $ptero::params::petri::port,
    app         => 'puppet:///modules/ptero/petri/app.py',
    environment => {
      'CELERY_BROKER_URL'                    => $ptero::params::petri::rabbitmq_url,
      'CELERY_RESULT_BACKEND'                => $ptero::params::petri::redis_celery_url,
      'DATABASE_URL'                         => $ptero::params::petri::database_url,
      'PTERO_PETRI_REDIS_HOST'               => $ptero::params::petri::redis_host,
      'PTERO_PETRI_REDIS_PORT'               => $ptero::params::petri::redis_port,
      'PTERO_PETRI_REDIS_PASSWORD'           => $ptero::params::petri::redis_password,
      'PTERO_PETRI_HOST'                     => $ptero::params::petri::host,
      'PTERO_PETRI_PORT'                     => $ptero::params::petri::port,
    },
  }
}
