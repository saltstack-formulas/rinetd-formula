{% from "rinetd/map.jinja" import rinetd with context -%}

rinetd_service:
  service.dead:
    - enable: False
    - name: {{ rinetd.service }}

rinetd_pkg:
  pkg.purged:
    - name: {{ rinetd.package }}
    - require:
      - service: rinetd_service

rinetd_config:
  file.absent:
    - name: {{ rinetd.config_file }}
    - require:
      - pkg: rinetd_pkg
