register_nginx_service:
  cmd.run:
    - name: C:\nssm\nssm-2.24\win64\nssm.ex install nginx "C:\nginx\nginx-1.28.0\nginx.exe"
    - unless: sc query nginx