start_nginx_service:
  service.running:
    - name: nginx
    - enable: true
