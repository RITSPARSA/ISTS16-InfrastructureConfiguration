Accounts-Predeploy
=========

This role will add local users and local admins to systems.

Requirements
------------

N/A

Role Variables
--------------

accounts - A list of standard accounts to create.
admin_accounts - A list of local admin accounts to create.

i.e.
accounts:
  - bob
  - bill

admin_accounts:
  - dad
  - mom

Dependencies
------------

N/A

Example Playbook
----------------


predeploy.yml

    - hosts: all
      roles:
         - accounts-predeploy

License
-------

Apache 2.0

Author Information
------------------

Kyle Carretto

