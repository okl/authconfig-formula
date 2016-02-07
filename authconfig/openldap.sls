/etc/openldap/ldap.conf:
  file.managed:
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - source: salt:///authconfig/templates/etc-openldap-ldap.conf.jinja
