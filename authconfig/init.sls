{% from "authconfig/map.jinja" import authconfig with context %}

/etc/sysconfig/authconfig:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - source: salt:///authconfig/templates/etc-sysconfig-authconfig.jinja

include:
  - .ldap
  - .nsswitch
  - .pam
  - .sssd
  - .nslcd
  - .nscd
  - .openldap


/etc/passwd:
  file.append:
    - name: /etc/passwd
    - source: salt:///authconfig/templates/etc-passwd-nis-info
    - template: jinja
