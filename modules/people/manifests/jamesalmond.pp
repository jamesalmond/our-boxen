class people::jamesalmond {

  ruby_gem { 'bundler for all rubies':
    gem              => 'bundler',
    version        => '~> 1.0',
    ruby_version => '*',
  }

  package { 
    [
      'virtualbox',
      'dockertoolbox',
      'dropbox'
      'licecap',
      'spotify',
      'flux',
      'adium',
      'caffeine',
      'firefox',
      'google-chrome',
      'atom'
    ]:
    ensure   => present,
    provider => 'brewcask'
  }

  include iterm2::stable
  include iterm2::colors::solarized_dark
  include zsh
  include ohmyzsh

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
}
