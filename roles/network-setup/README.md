Network Setup
=========

This role is responsible for using the fact {{ inventory_hostname }} and the dictionary 'machines' defined in /group_vars/all.yml to assign static ip addresses to machines, and to configure their DNS settings.

Requirements
------------

Dictionary in /group_vars/all.yml that is called 'machines'. 'machines' will map fqdn's to a dictionary containing an ip address and a team identifier.
i.e.

{ machines: {
    vm1.testing.ists: { 
      ip: "127.0.0.1",
      team_id: 0
    }
}

Role Variables
--------------
'machines' in /group_vars/all.yml
  Maps an FQDN to a team identifier and ip address

'hostnames' in /group_vars/all.yml
  Maps a machines' role to its hostname (i.e. AD --> sol)

'whiteteam_nameservers' in /group_vars/all.yml
  An optional list of nameservers to include

'whiteteam_hosts' in /group_vars/all.yml
  An optional dictionary of /etc/hosts definitions
  i.e.
  {'whiteteam_hosts': {'ip': 'hostname'}}

Dependencies
------------
The resolv.conf template will assign the default nameserver to the 'ad' host (defined in hostnames) by default.

Example Playbook
----------------

It is recommended to run this as the first role in deploy.yml

    - hosts: all
      roles:
         - network-setup

License
-------

Apache 2.0

Author Information
------------------

Kyle Carretto
