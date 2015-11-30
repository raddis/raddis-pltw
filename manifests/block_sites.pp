class pltw::block_sites ($sites = []) {

  $sites.each |$site| {
    host { $site:
      ensure  => present,
      ip      => '127.0.0.1',
      comment => 'pltw::website_block',
    }
  }

  # The hosts file is not used for anything besides blocking undesired sites.
  # To allow for automatic un-blocking, purge any unmanaged entries.
  resources { 'host':
    purge => true,
    noop  => true,
  }

}