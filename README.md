Genomics Candidate Test
=======================

Dependencies
------------

- Install vagrant (https://www.vagrantup.com)
- Install ansible with:

````
$ sudo pip install ansible
````

Bastion (master/management) box
-------------------------------

- Provisioning the bastion host

````
$ cd vagrant/bastion
$ vagrant up
````


OpenDJ server
-------------

- Provisioning the OpenDJ server

````
$ cd vagrant/opendj
$ vagrant up
````


Running the molecule tests
--------------------------

Each ansible role has a set of tests that can be run to verify it's working
correctly.  To run molecule you'll need the following dependencies:

- docker
- vagrant
- python 2.7
- pip 2.7
- ruby (not sure of the exact requirement but 2.0 or newer should work)
- pip modules: ansible, molecule, ansible-vagrant, docker-py, python-vagrant
- ruby gems: serverspec, rake, docker-api, rspec, rubocop

Once molecule is installed and working you can cd into any of the roles and run:

````
$ molecule test
````

Most of the roles use docker as the virtualisation provider as it tends to be
faster but the python role uses vagrant because molecule automatically installs
python into docker containers for you which would defeat the point of the tests.
