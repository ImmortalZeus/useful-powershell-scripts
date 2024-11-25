$DesignedCapacity = (Get-WmiObject -Class "BatteryStaticData" -Namespace "ROOT\WMI").DesignedCapacity
$FullChargedCapacity = (Get-WmiObject -Class "BatteryFullChargedCapacity" -Namespace "ROOT\WMI").FullChargedCapacity
Write-Host "Designed Capacity" $DesignedCapacity
Write-Host "Full Charged Capacity" $FullChargedCapacity
Write-Host "Battery Health:"(100*$FullChargedCapacity/$DesignedCapacity)"%"