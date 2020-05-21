configuration IISConfig 

param ([string[]]$computername = 'localhost')
node $computername{ 

Localconfigurationmanager{
configurationmode = "ApplyandAutocorrect"
configurationmodefrequencymins = 15
Refreshmode = "push"
}

windowsfeature IIS {
ensure = "present"
name = "web-server"}
windowsfeature IISManagement {
name = "web-mgmt-service"
ensure = "present"

}
Registry Remotemanagement{
key = 'HKLM:\SOFTWARE\Microsoft\webmanagement\server'
valuename = 'enableremotemanagement'
valuetype = 'dword'
valuedata = '1'

}
service wmsvc {
name = 'wmsvc'
startuptype = 'automatic'
state = 'running'
}
}
}

IISconfig -computername stn-websvr -outputpath c:\DSC
Start-DscConfiguration -path c:\DSC -wait -Verbose
Enter-PSSession -ComputerName stn-websvr
get-windowsfeature | Where-Object installed -EQ true

get-dsclocalconfigurationmanager

get-dscconfigurationstatus

Test-DscConfiguration


