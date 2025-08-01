install_nginx:
  archive.extracted:
    - name: C:\nginx
    - source: C:\nginx.zip
    - if_missing: C:\nginx\nginx-1.28.0\nginx.exe