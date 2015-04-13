class profile::jenkins_enterprise {
  include ::jenkins
  include ::git

  jenkins::job { 'puppet-site':
    config => template('profile/puppet-site.xml.erb'),
  }

  jenkins::job { 'profile-module':
    config => template('profile/profile-module.xml.erb'),
  }

  jenkins::credentials { 'puppet master':
    password            => '',
    private_key_or_path => template('profile/jenkins_pe_master_private_key'),
  }
}
