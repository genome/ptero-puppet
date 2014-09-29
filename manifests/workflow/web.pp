class ptero::workflow::web {
  require ptero::params

  ptero::web{'workflow':
    code_dir    => $ptero::params::workflow::target_directory,
    source      => $ptero::params::workflow::repo,
    revision    => $ptero::params::workflow::tag,
    host        => $ptero::params::workflow::host,
    listen_port => $ptero::params::workflow::port,
    app         => 'puppet:///modules/ptero/workflow/app.py',

    environment => {
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

