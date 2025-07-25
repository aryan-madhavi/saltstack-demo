download_nginx:
  file.managed:
    - name: C:\nginx.zip
    - source: https://nginx.org/download/nginx-1.28.0.zip
    - skip_verify: True

install_nginx:
  archive.extracted:
    - name: C:\nginx
    - source: C:\nginx.zip
    - if_missing: C:\nginx\nginx-1.28.0\nginx.exe
    - require:
      - file: download_nginx

download_nssm:
  file.managed:
    - name: C:\nssm.zip
    - source: https://nssm.cc/release/nssm-2.24.zip
    - skip_verify: True

install_nssm:
  archive.extracted:
    - name: C:\nssm
    - source: C:\nssm.zip
    - if_missing: C:\nssm\nssm-2.24\win64\nssm.exe
    - require:
      - file: download_nssm

register_nginx_service:
  cmd.run:
    - name: C:\nssm\nssm-2.24\win64\nssm.exe install nginx "C:\nginx\nginx-1.28.0\nginx.exe"
    - unless: sc query nginx
    - require:
      - archive: install_nginx
      - archive: install_nssm

start_nginx:
  service.running:
    - name: nginx
    - enable: True
    - require:
      - cmd: register_nginx_service
