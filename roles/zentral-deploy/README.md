Role Name
=========

Deploys Zentral with Docker-compose

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

The server FQDN must be resolvable using DNS or you will get the following error: Status code was not [200]: Request failed: <urlopen error [Errno -2] Name or service not known>

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

zentral_user - Administrator username for Zentral webapp
zentral_pass - Administrator's password
git_url - Location of Zentral source code

Dependencies
------------

network-setup

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: centos
      roles:
         - zentral-deploy

License
-------

Apache 2.0

Author Information
------------------
Ben Bornholm
Kyle Carretto
Kyle Schleich
