/etc/nsswitch.conf:
  file.managed:
    - template: jinja
    - source: salt://authconfig/templates/nsswitch.conf.jinja
    - user: root
    - group: root
    - mode: 0644

    
