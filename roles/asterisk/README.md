Asterisk role 
=============

This role will install asterisk on a centos 7 machine

NOTE: This role is only to be applied to a white team box

Requirements
------------

GCC should be installed for compilation of Asterisk

Role Variables
--------------

None

Dependencies
------------

None

Example Playbook
----------------

- hosts: voip
  roles:
    - { role: asterisk }

Author
------

Thomas Wygonik
