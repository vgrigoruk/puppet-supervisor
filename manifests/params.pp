class supervisor::params {
  require boxen::config

  $conf_file      = '${boxen::config::configdir}/supervisord.conf'
  $conf_dir       = '${boxen::config::configdir}/supervisord.d'
  $conf_ext       = '.ini'
  $system_service = 'supervisord'
  $package        = 'boxen/brews/supervisor'
}
