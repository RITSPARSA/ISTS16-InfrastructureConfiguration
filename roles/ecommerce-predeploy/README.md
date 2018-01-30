Ecommerce predeploy
=========

Installs and configures the Ecommerce python app with apache and mod_wsgi

Role Variables
--------------

git_repo - the repo the ecommerce app lives at

Dependencies
------------

network-setup

Example Playbook
----------------


    - hosts: ecomm
      roles:
         - ecomm-predeploy

License
-------

MIT

Author Information
------------------

Cameron Clark