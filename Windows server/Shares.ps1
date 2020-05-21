Install-WindowsFeature -name fs-resource-manager
get-windowsfeature | where-object installed -eq true
New-SmbShare -path H:\IT -FolderEnumerationMode AccessBased -FullAccess southend\sam.volk -Name IT
Grant-SmbShareAccess -Name IT -AccountName  -Force
Get-WindowsFeature -name fs*

Get-SmbOpenFile
close-smbsession -ClientComputerName 192.168.0.255
Close-SmbOpenFile -ClientComputerName 192.168.0.255
get-SmbServerConfiguration
Set-SmbServerConfiguration -EnableSMB1Protocol $false




