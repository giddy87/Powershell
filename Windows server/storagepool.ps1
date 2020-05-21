get-physicaldisk -canpool $true
Get-StorageSubSystem

New-StoragePool -FriendlyName allthedisks -StorageSubSystemUniqueId (Get-StorageSubSystem).uniqueid -PhysicalDisks (Get-PhysicalDisk -CanPool $true) 
New-VirtualDisk -FriendlyName CompanyData -StoragePoolFriendlyName allthedisks -ProvisioningType thin -size 2tb 
Get-VirtualDisk | Where-Object  size  -eq 2tb

Initialize-Disk -VirtualDisk (Get-VirtualDisk -FriendlyName companydata)

$vd = Get-VirtualDisk -FriendlyName companydata | Get-Disk

$vd | New-Partition -Size 1tb -DriveLetter V | Format-Volume -FileSystem Refs -AllocationUnitSize 4096 -NewFileSystemLabel "IT files"  