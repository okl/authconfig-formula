{% from "authconfig/map.jinja" import authconfig with context %}

/etc/nslcd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - source: salt:///authconfig/templates/etc-nslcd.conf.jinja

nslcd:
  pkg.installed:
    - name: nss-pam-ldapd
  service.running:
    - enable: True
    - name: nslcd
    - watch:
      - file: /etc/nslcd.conf
      - pkg: nss-pam-ldapd
