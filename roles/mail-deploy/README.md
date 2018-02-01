Role Name
=========

This role is to configure hMail server after installation.

Requirements
------------

Make sure the the windows hotpatch is installed on the following systems

    - Server 2008
    - Server 2012
    - 7
    - 8

https://support.microsoft.com/en-us/help/2842230/-out-of-memory-error-on-a-computer-that-has-a-customized-maxmemorypers

Role Variables
--------------

The domain name to user for the mail server:

    hmail_domain_name: example.local

The users to install on the system:

    hmail_users:
      - user1
      - user2

The password to assign to all the users:

    hmail_password: "changeme"

Dependencies
------------

None

Example Playbook
----------------

    - hosts: mail
      roles:
         - mail-deploy

License
-------

Apache

Author
------

Micah J. Martin

github.com/micahjmartin
