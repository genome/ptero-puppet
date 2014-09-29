define ptero::code (
  $source,
  $revision,
  $owner,
  $group,
) {

  if ! defined(Vcsrepo[$title]) {
    vcsrepo {$title:
      ensure   => present,
      provider => git,
      source   => $source,
      revision => $revision,
      owner    => $owner,
      group    => $group,
      require  => Package['git'],
    }
  }

  if ! defined(Python::Virtualenv["$title/virtualenv"]) {
    python::virtualenv {"$title/virtualenv":
      requirements => "$title/requirements.txt",
      owner        => $owner,
      group        => $group,
      systempkgs   => true,
      require      => Vcsrepo[$title],
      subscribe    => Vcsrepo[$title],
    }
  }

  if ! defined("$title-extra-requirements") {
    exec {"$title-extra-requirements":
      command => "$title/virtualenv/bin/pip install librabbitmq hiredis",
      user    => $owner,
      group   => $group,
      require => Python::Virtualenv["$title/virtualenv"],
    }
  }
}
