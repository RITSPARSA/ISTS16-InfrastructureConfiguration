Role Name
=========

This role is used before deployment to install common packages onto a system.

Requirements
------------

None.

Role Variables
--------------

This role loads variables based on the distribution family, please see the files in /vars for more information.
It does this to account for the same packages having different names based on the distribution (i.e. nc vs. netcat)

Dependencies
------------

None.

Example Playbook
----------------

<predeploy.yml>

    - hosts: linux
      roles:
         - packages

License
-------

Apache License Version 2.0

Author Information
------------------

Kyle Carretto
