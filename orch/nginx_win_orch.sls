# Step 1: Download Nginx
download_nginx:
  salt.state:
    - tgt: 'win-minion'
    - sls: nginx.download_nginx

# Step 2: Extract Nginx
install_nginx:
  salt.state:
    - tgt: 'win-minion'
    - sls: nginx.install_nginx
    - require:
      - salt: download_nginx

# Step 3: Download NSSM
download_nssm:
  salt.state:
    - tgt: 'win-minion'
    - sls: nssm.download_nssm
    - require:
      - salt: install_nginx

# Step 4: Extract NSSM
install_nssm:
  salt.state:
    - tgt: 'win-minion'
    - sls: nssm.install_nssm
    - require:
      - salt: download_nssm

# Step 5: Register Nginx with NSSM
register_nginx_service:
  salt.state:
    - tgt: 'win-minion'
    - sls: services.register_nginx
    - require:
      - salt: install_nssm

# Step 6: Start Nginx service
start_nginx_service:
  salt.state:
    - tgt: 'win-minion'
    - sls: services.start_nginx
    - require:
      - salt: register_nginx_service