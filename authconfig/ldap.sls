{% from "authconfig/map.jinja" import authconfig with context %}

/etc/ldap.secret:
  file.managed:
    - user: root
    - group: root
    - contents_pillar: authconfig:ldap:secret
    - mode: 0400


/etc/ldap.conf:
  file.managed:
    - user: root
    - group: root
    - template: jinja
    - source: salt:///authconfig/templates/ldap.conf.jinja
    - mode: 0644
