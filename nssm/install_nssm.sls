install_nssm:
  archive.extracted:
    - name: C:\nssm
    - source: C:\nssm.zip
    - if_missing: C:\nssm\nssm-2.24\win64\nssm.exe