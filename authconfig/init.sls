{% from "authconfig/map.jinja" import authconfig with context %}

/etc/netgroup:
  file.managed:
    - source: salt:///authconfig/templates/etc-netgroup.jinja
    - name: /etc/netgroup
    - template: jinja
    - user: root
    - group: root
    - mode: 0644

/etc/auto.master:
  file.managed:
    - name: /etc/auto.master
    - source: salt:///authconfig/templates/auto.master.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - watch_in: autofs

/etc/auto_xhome:
  file.managed:
    - name: /etc/auto_xhome
    - source: salt:///authconfig/templates/auto_xhome.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - watch_in: autofs

/etc/auto.home:
  file.managed:
    - name: /etc/auto.home
    - source: salt:///authconfig/templates/auto.home.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - watch_in: autofs

/etc/auto_home:
  file.symlink:
    - name: /etc/auto_home
    - target: /etc/auto.home
    - watch_in: autofs

/etc/auto_pkg:
  file.managed:
    - name: /etc/auto_pkg
    - source: salt:///authconfig/templates/auto_pkg.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - watch_in: autofs


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

autofs-service:
  service.running:
    - name: autofs
    - enable: True
    - reload: True
