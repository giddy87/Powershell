invoke-command stn-cluster-01, stn-cluster-02 {get-service *iscsi* | Set-Service -StartupType Automatic -PassThru |Start-Service}
invoke-command stn-cluster-01, stn-cluster-02 {Get-InitiatorPort}
invoke-command stn-cluster-01, stn-cluster-02 {New-IscsiTargetPortal -TargetPortalAddress 192.168.2.3}

invoke-command stn-cluster-01, stn-cluster-02 {Get-IscsiTargetportal | Update-IscsiTargetPortal}
invoke-command stn-cluster-01, stn-cluster-02 {Get-IscsiTarget }
| Connect-IscsiTarget}
invoke-command stn-cluster-01, stn-cluster-02 {Get-IscsiSession | Register-IscsiSession}

invoke-command stn-cluster-01, stn-cluster-02 {Install-WindowsFeature failover-clustering}