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

packages - This variable exists in each of the os family specific yml files, and indicates a list of packages to install (The names of the package should be specific to the distribution / os family they are being installed on). A common.yml file was considered for installing packages with common names across os families, but it was determined that as more operating systems were added, the need to constantly adjust that file would increase and the amount of packages in it would become very low, and so that option has been avoided for the time being.

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
