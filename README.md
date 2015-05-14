# puppetagent

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with puppetagent](#setup)
    * [What puppetagent affects](#what-puppetagent-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with puppetagent](#beginning-with-puppetagent)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Installs the Puppet agent and manages the configuration and service.

## Module Description

The purpose of this module is to manage the puppet agent. There are various attempts
out there that all work to some degree but I never found one I like. I need something
that will manage Linux and Windows the same way. I'm convinced Windows is no longer a
second class citizen in the Puppet world. This is my attempt.

## Setup

### What puppetagent affects

* Installs the Puppet agent.
* Manages official installation sources.
* Manages the Puppet agent version.
* Manages the puppet.conf file. Including for a puppet master.
* Manages the Puppet service.

### Beginning with puppetagent

To use puppetagent with defaults:

```puppet  
include 'puppetagent'
```

To install a different version:

```puppet
class { 'puppetagent':
  version => '3.7.5',
}
```

In order to change to a puppet master:

```puppet
class { 'puppetagent':
  puppetmaster => 'puppetmaster.example.net',
}
```

## Limitations

While I am attempting to cover every operating system, none of this is fully
tested. Use at your own risk.

## Development

Please send pull requests for OSs not covered. If you don't have time, submit an issue
and I will attempt to add support.


