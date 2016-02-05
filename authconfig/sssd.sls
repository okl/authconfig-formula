{% from "authconfig/map.jinja" import authconfig with context %}

/etc/sssd/sssd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0600
    - template: jinja
    - source: salt:///authconfig/templates/sssd.conf.jinja


sssd:
  pkg.installed:
    - name: sssd
  service.running:
    - name: sssd
    - enable: {{ authconfig.sssd.enable }}
    - require: 
      - pkg: sssd
    - watch:
      - file: /etc/sssd/sssd.conf

