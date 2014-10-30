class ptero::petri::celery {
  require ptero::params

  ptero::celery{'petri-fork':
    code_dir    => $ptero::params::petri::target_directory,
    source      => $ptero::params::petri::repo,
    revision    => $ptero::params::petri::tag,
    app         => 'ptero_petri.implementation.celery_app:app',
    queue       => 'fork',
    concurrency => $ptero::params::petri::celery_fork_workers,
    environment => {
      'CELERY_BROKER_URL'     => $ptero::params::petri::rabbitmq_url,
      'CELERY_RESULT_BACKEND' => $ptero::params::petri::redis_url,
      'PYTHONPATH'            => $ptero::params::petri::target_directory,
    },
  }

  ptero::celery{'petri-http':
    code_dir    => $ptero::params::petri::target_directory,
    source      => $ptero::params::petri::repo,
    revision    => $ptero::params::petri::tag,
    app         => 'ptero_petri.implementation.celery_app:app',
    queue       => 'http',
    concurrency => $ptero::params::petri::celery_http_workers,
    environment => {
      'CELERY_BROKER_URL'     => $ptero::params::petri::rabbitmq_url,
      'CELERY_RESULT_BACKEND' => $ptero::params::petri::redis_url,
      'PYTHONPATH'            => $ptero::params::petri::target_directory,
    },
  }

}
