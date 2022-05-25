function New-DHCPReservation
{
    
<#
    .Synopsis
       Creates a new DHCP reservation
    .DESCRIPTION
       Looks up a free IP address and assigns it to a device using required parameters
    .EXAMPLE
       New-DHCPReservation -Server DC -Mac 00-00-00-00-00-00 -Scope 10.0.0.0
                #>

Param
    (
        # Name of the DHCP Server
        [Parameter(Mandatory=$true,
                   Position=0)]
        $Server,

        # Mac address of the device to assign a reservation
        [Parameter(Mandatory=$true,
                   Position=2)]
        $Mac,

        # Scope ID of the DHCP Scope desired to add reservation into
        [Parameter(Mandatory=$true,
                   Position=1)]
        $Scope
    )

$NewIp = Get-DhcpServerv4FreeIPAddress -ComputerName $Server -ScopeId $Scope

Add-DhcpServerv4Reservation -ComputerName $Server -ScopeId $Scope -ClientId "$Mac" -IPAddress "$NewIp"

Write-Host "The device with ID $Mac will now have the IP reservation address of $NewIp after reboot."
} #function