SMB-Deploy
=========

This role creates SMB shares on windows machines

Requirements
------------

N/A

Role Variables
--------------

shares - a list of shares to create

i.e.

shares:
  - share_name: space_rocks
    share_directory: C:/space_rocks

Dependencies
------------

Windows


Example Playbook
----------------

deploy.yml

    - hosts: Windows
      roles:
         - smb-deploy

License
-------

Apache 2.0

Author Information
------------------

Matt Chin
Kyle Carretto
