{% from "rinetd/map.jinja" import rinetd with context -%}

rinetd_config:
  file.managed:
    - name: {{ rinetd.config_file }}
    - template: jinja
    - source: salt://rinetd/files/rinetd.conf.jinja
    - require:
      - pkg: rinetd_pkg
    - watch_in:
      - service: rinetd_service
