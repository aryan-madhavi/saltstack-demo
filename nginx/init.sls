{% if grains['os_family'] == 'Debian' or grains['os_family'] == 'RedHat' %}

nginx_package:
  pkg.installed:
    - name: nginx

nginx_service:
  service.running:
    - name: nginx
    - enable: True
    - require:
      - pkg: nginx_package

{% elif grains['os_family'] == 'Windows' %}

nginx_win_installer:
  chocolatey.installed:
    - name: nginx

nginx_win_enable:
  service.enabled:
    - name: nginx

nginx_win_service:
  service.running:
    - name: nginx
    - require:
      - chocolatey: nginx_win_installer
      - service: nginx_win_enable

{% else %}

unsupported_os:
  test.show_notification:
    - text: "Nginx setup is not supported on this OS: {{ grains['os'] }}"

{% endif %}
