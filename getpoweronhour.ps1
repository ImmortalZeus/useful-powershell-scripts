$objWMI = ObjGet("winmgmts:\\.\root\cimv2")
$oUptime = $objWMI.ExecQuery("Select * from Win32_PerfFormattedData_PerfOS_System")
    For $sTime In $oUptime
        ConsoleWrite(($sTime.SystemUpTime / 60) & " minutes" & @CRLF)
    Next