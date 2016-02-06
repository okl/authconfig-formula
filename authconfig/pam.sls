{% from "authconfig/map.jinja" import authconfig with context %}

/etc/pam.d/password-auth-ac:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - source: salt:///authconfig/templates/etc-pam.d-password-auth-ac

/etc/pam_ldap.conf:
  file.symlink:
    - target: /etc/ldap.conf
    - force: True
