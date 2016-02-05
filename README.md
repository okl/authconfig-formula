=====
authconfig
=====

Setup authconfig for linux systems

.. note::


    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``authconfig``
---------

Meta-state for inclusion of all states

Next-generation, alternate approach
===================================

The following states provide an alternate approach to managing authconfig and secondary
servies, as well as code organization, taken from nginx, and adapted to authconfig.
Please provide feedback by filing issues, discussing in ``#salt`` in Freenode and the mailing list as normal.

.. contents::
    :local:

Meta-state for inclusion of all ng states.

**Note:** authconfig requires the merge parameter of salt.modules.pillar.get(),
first available in the Helium release.

``authconfig.install``
--------------------

Installs the necessary secondary packages.


``authconfig.ldap``
--------------------

Configures ldap-client


``authconfig.sssd``
--------------------

Configures sssd


``authconfig.nsswitch``
--------------------

Configures nsswitch


``authconfig.nslcd``
--------------------

Configures nslcd


``authconfig.pam``
--------------------

Configures pluggable authentication modules

