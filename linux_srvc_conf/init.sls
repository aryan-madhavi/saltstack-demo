stop_nginx:
  service.dead:
    - name: nginx

install_httpd:
  pkg.installed:
    - name: httpd

start_httpd:
  service.running:
    - name: httpd
    - enable: True
    - require:
      - pkg: install_httpd
