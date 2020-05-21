Install-WindowsFeature hyper-v-powershell 
dir c:\
new-vhd -Path c:\VMdata.vhdx -SizeBytes 2gb -dynamic 
get-disk | Where-Object partitionstyle -eq "raw"
initialize-disk -Number 6 -PartitionStyle GPT 
New-Partition -DiskNumber 6 -AssignDriveLetter -UseMaximumSize 
Format-Volume -FileSystem ntfs -DriveLetter h 
get-disk
