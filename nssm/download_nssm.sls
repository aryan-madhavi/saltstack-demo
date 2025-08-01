download_nssm:
  file.managed:
    - name: C:\nssm.zip
    - source: https://nssm.cc/release/nssm-2.24.zip
    - skip_verify: True