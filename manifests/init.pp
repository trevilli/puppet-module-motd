# == Class: motd
#
# Module to manage motd
#
class motd (

) {

  $banner = $::role ? {
    'puppetmaster' => "\nShould you really be logged in here?\n\n",
    'webserver'    => "\nWelcome to ${::fqdn}. This is a webserver.\n\n",
    default        => "\nWelcome to ${::fqdn}.\n\n",
  }

  file { '/etc/motd':
    ensure  => file,
    content => $banner,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
