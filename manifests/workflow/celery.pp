class ptero::workflow::celery {
  require ptero::params

  ptero::celery{'workflow':
    code_dir    => $ptero::params::workflow::target_directory,
    source      => $ptero::params::workflow::repo,
    revision    => $ptero::params::workflow::tag,
    app         => 'ptero_workflow.implementation.celery_app:app',
    concurrency => $ptero::params::workflow::celery_workers,
    environment => {
      'CELERY_BROKER_URL'        => $ptero::params::workflow::rabbitmq_url,
      'CELERY_RESULT_BACKEND'    => $ptero::params::workflow::redis_url,
      'PYTHONPATH'               => $ptero::params::workflow::target_directory,
      'PTERO_PETRI_HOST'         => $ptero::params::petri::host,
      'PTERO_PETRI_PORT'         => $ptero::params::petri::port,
      'PTERO_SHELL_COMMAND_HOST' => $ptero::params::shell_command::host,
      'PTERO_SHELL_COMMAND_PORT' => $ptero::params::shell_command::port,
      'PTERO_WORKFLOW_HOST'      => $ptero::params::workflow::host,
      'PTERO_WORKFLOW_PORT'      => $ptero::params::workflow::port,
      'PTERO_WORKFLOW_DB_STRING' => $ptero::params::workflow::database_url,
    },
  }
}
