{% from "authconfig/map.jinja" import authconfig with context %}

/etc/sssd/sssd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0600
    - template: jinja
    - source: salt:///authconfig/templates/sssd.conf.jinja


sssd:
  service.running:
    - name: {{ authconfig.sssd.service }}   
    - enable: {{ authconfig.sssd.enable }}
    - require: 
      - pkg: {{ authconfig.sssd.package }}
    - watch:
      - file: /etc/sssd/sssd.conf
    
