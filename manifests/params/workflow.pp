class ptero::params::workflow {
  $database_type = hiera('workflow-database-type', 'postgres')
  $database_host = hiera('workflow-database-host', 'localhost')
  $database_username = hiera('workflow-database-username', '')
  $database_password = hiera('workflow-database-password', '')
  $database_name = hiera('workflow-database-username', '')
  $database_url = "$database_type://$database_username:$database_password@$database_host/$database_name"

  $rabbitmq_host = hiera('workflow-rabbit-host', 'localhost')
  $rabbitmq_port = hiera('workflow-rabbit-port', 5672)
  $rabbitmq_vhost = hiera('workflow-rabbit-vhost', '/')
  $rabbitmq_username = hiera('workflow-rabbit-user', 'guest')
  $rabbitmq_password = hiera('workflow-rabbit-password', 'guest')
  $rabbitmq_full_user = "$rabbitmq_username@$rabbitmq_vhost"
  $rabbitmq_url = "amqp://$rabbitmq_username:$rabbitmq_password@$rabbitmq_host:$rabbitmq_port/$rabbitmq_vhost"

  $redis_host = hiera('workflow-redis-host', 'localhost')
  $redis_port = hiera('workflow-redis-port', 6379)
  $redis_password = hiera('workflow-redis-password', '')
  $redis_url = "redis://:$redis_password@$redis_host:$redis_port"

  $target_directory = hiera('workflow-target-directory', '/var/www/workflow')
  $repo = hiera('workflow-repo', '')
  $tag = hiera('workflow-tag', '')

  $host = hiera('workflow-host', $::ipaddress)
  $port = hiera('workflow-port', 80)
  $url = "http://$host:$port"

  $celery_workers = hiera('workflow-celery-workers', 1)
}
