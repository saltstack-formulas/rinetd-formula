{% from "rinetd/map.jinja" import rinetd with context -%}

rinetd_pkg:
  pkg.installed:
    - name: {{ rinetd.package }}

rinetd_service:
  service.running:
    - name: {{ rinetd.service }}
    - enable: True
    - restart: True
    - require:
      - pkg: rinetd_pkg
