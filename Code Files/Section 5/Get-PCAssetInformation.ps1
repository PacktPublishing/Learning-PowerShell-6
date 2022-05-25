<#
    .Synopsis
       Gets basic computer asset information
    .DESCRIPTION
       Gets information from the bios and computer system using WMI and builds a simple information set that displays on screen
    .EXAMPLE
       Simply run on the machine and the report will display on the screen
                #>

$Computersystem = (get-wmiobject win32_computersystem)
$Bios = (get-wmiobject win32_bios)
$Results = @{'Computer Name' = $Computersystem.name;
	                'Model' = $Computersystem.model;
	                'Serial Number' = $Bios.SerialNumber}

$Report = New-Object -TypeName psobject -Property $Results

Clear-Host
$Report