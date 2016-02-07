/etc/nscd.conf:
  file.managed:
    - source: salt:///authconfig/templates/nscd.conf.jinja
    - user: root
    - group: root
    - mode: 0644
    - template: jinja`


nscd:
  service.running:
    - enable: True
    - watch:
      - file: /etc/nscd.conf
