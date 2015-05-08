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
out there that all work to some degree but I never found one I like. This is my 
attempt.

## Setup

### What puppetagent affects

* Installs the Puppet agent
* Manages the Puppet agent version.
* Manages the puppet.conf file.
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

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

While I am attempting to cover every operating system, none of this is fully
tested. Use at your own risk.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
