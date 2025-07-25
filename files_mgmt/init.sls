create_dir:
  file.directory:
    - name: /opt/files


create_file:
  file.managed:
    - name: /opt/files/info.txt
    - contents: |
        This directory was made on command of the salt-master
        This line was appended later on
