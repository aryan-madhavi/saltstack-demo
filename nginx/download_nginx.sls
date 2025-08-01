download_nginx:
  file.managed:
    - name: C:\nginx.zip
    - source: https://nginx.org/download/nginx-1.28.0.zip
    - skip_verify: True