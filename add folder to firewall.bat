for /R "E:\ImageMatting\" %%G in (*.exe) do (

netsh advfirewall firewall add rule name="Blocked With Batchfile %%G" dir=in action=block program="%%G" enable=yes profile=any
netsh advfirewall firewall add rule name="Blocked With Batchfile %%G" dir=out action=block program="%%G" enable=yes profile=any

)