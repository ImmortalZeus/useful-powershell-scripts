# List of remote machines
$remoteMachines = @("Srv1", "Srv2", "Srv3", "Srv4", "Srv5")

# Output array to store results
$outputArray = @()

# Loop through each remote machine
foreach ($machine in $remoteMachines) {
    # Check if the machine is reachable
    if (Test-Connection -ComputerName $machine -Count 1 -Quiet) {
        # Run slmgr.vbs /xpr remotely
        $activationStatus = Invoke-Command { (cscript /NoLogo "c:\Windows\system32\slmgr.vbs" /xpr) -join '' } -ComputerName $machine
            
        # Add results to the output array
        $outputArray += [PSCustomObject]@{
            ComputerName =$machine
            ActivationStatus =$activationStatus
        }
    } else{
        Write-Host "Unable to reach $machine. Check the connection or the machine may be offline."
    }
}

# Display results in a grid
$outputArray | Out-GridView