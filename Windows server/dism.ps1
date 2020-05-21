get-command -Module dism
dir C:\Image
cd C:\Image
Get-WindowsImage -ImagePath .\install.wim
Mount-WindowsImage -ImagePath.\install.wim -Index 3 -Path .\Mount
enable-WindowsOptionalFeature -Path .\Mount -FeatureName dhcpserver
Dismount-WindowsImage -Path .\Mount -Save
