/etc/ldap.secret:
  file.managed:
    - user: root
    - group: root
    - contents_pillar: authconfig:ldap:secret
    - mode: 0400


