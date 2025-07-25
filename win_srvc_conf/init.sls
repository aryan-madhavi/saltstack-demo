stop_windows_update:
  service.dead:
    - name: wuauserv

start_windows_update:
  service.running:
    - name: wuauserv
