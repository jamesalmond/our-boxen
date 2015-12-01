class people::jamesalmond {

  ruby_gem { 'bundler for all rubies':
    gem              => 'bundler',
    version        => '~> 1.0',
    ruby_version => '*',
  }

  sudoers { 'installer':
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => [
      '(ALL) SETENV:NOPASSWD: /usr/sbin/installer',
    ],
    type     => 'user_spec',
  }

  package {
    [
      'virtualbox',
      'dockertoolbox',
      'dropbox',
      'licecap',
      'spotify',
      'flux',
      'adium',
      'caffeine',
      'firefox',
      'google-chrome',
      'atom',
      '1password',
      'anki'
    ]:
    ensure   => present,
    provider => 'brewcask',
    require  => [ Sudoers['installer'] ],
  }

  include iterm2::stable
  include iterm2::colors::solarized_dark
  include zsh
  include ohmyzsh
  include janus


  # General settings
  include osx::global::expand_print_dialog
  include osx::global::disable_autocorrect
  include osx::dock::disable_dashboard
  include osx::finder::unhide_library
  include osx::finder::show_all_filename_extensions
  include osx::no_network_dsstores
  include osx::safari::enable_developer_mode
  class { 'osx::dock::position':
    position => 'bottom'
  }
  class { 'osx::dock::icon_size':
    size => 16
  }
  class { 'osx::dock::magnification':
    magnification => false
  }

  git::config::global { 'user.email':
    value => 'james@jamesalmond.com'
  }

  git::config::global { 'user.name':
    value => 'James Almond'
  }

  git::config::global { 'alias.co':
    value => 'checkout'
  }
  git::config::global { 'alias.ci':
    value => 'commit'
  }
  git::config::global { 'color.diff':
    value => 'auto'
  }
  git::config::global { 'color.status':
    value => 'auto'
  }
  git::config::global { 'color.branch':
    value => 'auto'
  }
  git::config::global { 'color.ui':
    value => 'true'
  }
  git::config::global { 'core.editor':
    value => 'vim'
  }
}
