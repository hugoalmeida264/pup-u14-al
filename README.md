Demo with puppetlabs/boxes/ubuntu-14.04-64-nocm hello world vagrant app

=============================================
Table of Contents:
=============================================

- Credits:
- Changelog:
- Known issues:
- Introduction:
- Setup:
1 - The host
  1.1 - OS version
  1.2 - Editor
  1.3 - Type 2 virtualization
  1.4 - Vagrant
  1.5 - Scripts
  1.5.1 -
  1.6 - Observations
2 - The Guest
  2.1 - Setup
  2.2 - Tools
  2.3 - Docker
  2.4 - Nginx
- Known issues:
- Backlog:

=============================================
- Credits:
=============================================

I didn't pulled this off on my own, I had many help guidance
from the work of great articles and it's with humble gratitude
I want to say thank you! and recognize their work to make the
knowledge community amazing:

Docker:
http://geekyplatypus.com/making-your-dockerised-php-application-even-better/

Puppet:
http://www.puppet.com
https://github.com/garethr/garethr-docker
https://forge.puppet.com/saz/sudo/1.0.1

Vagrant:
https://www.vagrantup.com/
https://github.com/zsprackett/vagrant-tutorial/blob/master/web-cluster/Vagrantfile
https://gist.github.com/roblayton/c629683ca74658412487

Nginx:
http://nginx.org/en/docs/http/load_balancing.html
http://stackoverflow.com/questions/6533819/load-balancing-php-web-application-with-three-servers

Html & Random Quote:
http://mycodingblog.com/random-quote-tutorial-part-ii/
http://www.htmlgoodies.com/tutorials/getting_started/article.php/3479551
http://api.forismatic.com

=============================================
Changelog:
=============================================
v0.1a-rc

Added docker

v0.2b-rc

Ngnix cluster on top of docker v0.1a-rc

v0.2c-rc

Random quote application v0.1a-rc

=============================================
Introduction
=============================================

There are two vagrant configurations:
a) Single Ngnix over docker with docker-compose and the configuration files
are stored in the host disk so you can change the configuration and add them
easily to your version control system.

b) Cluster of 1xlb 2xapp on Ngnix with docker-compose and the configuration files
are stored in the host disk so you can change the configuration and add them
easily to your version control system.

=============================================
- Setup:
=============================================

1 - The host
  1.1 - OS version
    MacOS Sierra 10.12.1
  1.2 - Editor
    Vim
    Atom
  1.3 - Type 2 virtualization
    Oracle Virtualbox 5.0.28 r111378
  1.4 - Vagrant
    Vagrant 1.8.4

  1.5 - Single Docker Files
  .
  ├── Vagrantfile - Vagrant configuration file
  ├── config
  │   └── init.sh - Provision shell script
  ├── guest
  │   ├── docker
  │   │   ├── config
  │   │   │   └── site.conf - Nginx app server Docker App default.conf file
  │   │   ├── docker-compose.yml - Docker-compose configuration
  │   │   └── html
  │   │       └── hello-world
  │   │           └── index.html - html to display hello-world
  │   └── puppet
  │       └── init_local.pp - puppet manifest
  └── install.sh - script to initiate provisioning, detects if port 80 is free and
                  breaks execution if error condition is met.

  1.6 - Cluster Files
.
├── Vagrantfile  - Vagrant configuration file
├── config
│   └── init.sh - Provision shell script
├── guest
│   ├── docker
│   │   ├── app
│   │   │   ├── config
│   │   │   │   └── site.conf - Nginx app server Docker App default.conf file
│   │   │   ├── docker-compose.yml - Docker-compose configuration
│   │   │   └── log.conf
│   │   ├── html
│   │   │   └── random
│   │   │       ├── index.html - html to display quote
│   │   │       └── newquotes.js - js function to pull and transform API call
│   │   └── lb
│   │       ├── config
│   │       │   └── default.conf - Nginx lb server Docker App default.conf file
│   │       └── docker-compose.yml - Docker-compose configuration
│   └── puppet
│       ├── init_app.pp - Puppet manifest for app server
│       └── init_lb.pp - Puppet manifest for load balancer server
└── install.sh - script to initiate provisioning, detects if port 80 is free and
                breaks execution if error condition is met.


=============================================
- Known issues:
=============================================

Vagrant reload - crashes docker, Workaround: run vagrant up --provision to re-rerun puppet in all severs. See backlog for more details of fix

Vagrant 1.8.7 has an issue on my Mac which prevents to download the vagrant machines,
workaround - downgrade to version 1.8.4
=============================================
- Backlog:
=============================================

- Add crontab for "puppet apply"

- Add crontab to docker-compose refresh

- Change Cluster Vagrantfile to deploy servers from a single configuration blockquote.

- Improve random quote quote at the html and js level and remove unnecessary code
from newquotes.js.

- Improve documentation at the code level with comments.

- resolve "Warning: Could not retrieve fact fqdn" @puppet provisioning
