class ptero::petri::celery {
  require ptero::params

  ptero::celery{'petri':
    code_dir    => $ptero::params::petri::target_directory,
    source      => $ptero::params::petri::repo,
    revision    => $ptero::params::petri::tag,
    app         => 'ptero_petri.implementation.celery_app:app',
    concurrency => $ptero::params::petri::celery_workers,
    environment => {
      'CELERY_BROKER_URL'          => $ptero::params::petri::rabbitmq_url,
      'CELERY_RESULT_BACKEND'      => $ptero::params::petri::redis_celery_url,
      'PYTHONPATH'                 => $ptero::params::petri::target_directory,
      'PTERO_PETRI_REDIS_HOST'     => $ptero::params::petri::redis_host,
      'PTERO_PETRI_REDIS_PORT'     => $ptero::params::petri::redis_port,
      'PTERO_PETRI_REDIS_PASSWORD' => $ptero::params::petri::redis_password,
      'PTERO_PETRI_HOST'           => $ptero::params::petri::host,
      'PTERO_PETRI_PORT'           => $ptero::params::petri::port,
    },
  }

}
