# Supervisor Puppet Module for Boxen

Install and manage supervisor daemon control utility under boxen.

[![Build Status](https://travis-ci.org/vgrigoruk/puppet-supervisor.svg?branch=master)](https://travis-ci.org/vgrigoruk/puppet-supervisor)

## Usage

```puppet
include supervisor

supervisor::service {
  'myapp':
    ensure      => present,
    command     => '/usr/bin/myapp',
    environment => 'ENV_VAR_1=somevalue,ENV_VAR_2=othervalue',
    user        => 'user',
    group       => 'group',
    require     => [ Package['myapp']];
}
```

## Required Puppet Modules

* `boxen`
* `python`

## Development

Set `GITHUB_API_TOKEN` in your shell with a [Github oAuth Token](https://help.github.com/articles/creating-an-oauth-token-for-command-line-use) to raise your API rate limit. You can get some work done without it, but you're less likely to encounter errors like `Unable to find module 'boxen/puppet-boxen' on https://github.com`.

Then write some code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
