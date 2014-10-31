class ptero::params::petri {
  $database_type = hiera('petri-database-type', 'postgres')
  $database_host = hiera('petri-database-host', 'localhost')
  $database_username = hiera('petri-database-username', '')
  $database_password = hiera('petri-database-password', '')
  $database_name = hiera('petri-database-username', '')
  $database_url = "$database_type://$database_username:$database_password@$database_host/$database_name"

  $rabbitmq_host = hiera('petri-rabbit-host', 'localhost')
  $rabbitmq_port = hiera('petri-rabbit-port', 5672)
  $rabbitmq_vhost = hiera('petri-rabbit-vhost', '/')
  $rabbitmq_username = hiera('petri-rabbit-user', 'guest')
  $rabbitmq_password = hiera('petri-rabbit-password', 'guest')
  $rabbitmq_full_user = "$rabbitmq_username@$rabbitmq_vhost"
  $rabbitmq_url = "amqp://$rabbitmq_username:$rabbitmq_password@$rabbitmq_host:$rabbitmq_port/$rabbitmq_vhost"

  $redis_celery_host = hiera('petri-redis-celery-host', 'localhost')
  $redis_celery_port = hiera('petri-redis-celery-port', 6379)
  $redis_celery_password = hiera('petri-redis-celery-password', '')
  $redis_celery_url = "redis://:$redis_password@$redis_host:$redis_port"

  $redis_host = hiera('petri-redis-host', 'localhost')
  $redis_port = hiera('petri-redis-port', 6379)
  $redis_password = hiera('petri-redis-password', '')
  $redis_url = "redis://:$redis_password@$redis_host:$redis_port"

  $target_directory = hiera('petri-target-directory', '/var/www/petri')
  $repo = hiera('petri-repo', '')
  $tag = hiera('petri-tag', '')

  $host = hiera('petri-host', $::ipaddress)
  $port = hiera('petri-port', 80)
  $url = "http://$host:$port"

  $celery_workers = hiera('petri-celery-workers', 1)
}
