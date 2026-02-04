 param(
    [Parameter(Mandatory)]$SubscriptionId,
    [Parameter(Mandatory)]$StorageaccountName,
    [Parameter(Mandatory)]$ResourceGroupName,
	[Parameter(Mandatory)]$CSVPath)
 #Install-Module Az
 #Install-Module -Name Az -Scope CurrentUser -AllowClobber -force
 #Import-Module Az
 #Import-Module Az.Account
 Connect-AzAccount
 Get-AzContext
 Select-AzSubscription -SubscriptionId $SubscriptionId
 $Path = Get-ChildItem $CSVPath
 $Strgkey=Get-AzStorageAccountKey -ResourceGroupName $ResourceGroupName -Name $StorageaccountName
 $ctx = New-AzStorageContext -StorageAccountName $StorageaccountName -StorageAccountKey $Strgkey
 foreach($filename in  $Path)
 {
 $csvs = Import-Csv -Path $CSVPath$filename
 $ID = $csvs[0].psobject.Properties.Name[0]
 write-host($ID)
 #$filesystemName = "root"
 
 #If ( $ID -eq 'GroupName' ) 
 #{
 #foreach ( $csv in $csvs )
 #{
 #$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType Group -EntityId ($csv.GroupID) -Permission r-x
 #Update-AzDataLakeGen2AclRecursive -Context $ctx -FileSystem $filesystemName -Path ($csv.Path) -Acl $acl
 #$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType Group -EntityId ($csv.GroupID) -Permission r-x -InputObject $acl -DefaultScope
 #Update-AzDataLakeGen2AclRecursive -Context $ctx -FileSystem $filesystemName -Path ($csv.Path) -Acl $acl
 #Write-Host ("Updated storage account '$(gskpscstgacc)' with FileSystem  '$filesystemName' under the Path '$($csv.Path)' with Group Name") -Separator " -> " $csv.GroupName
 #}
 #}
 #elseif ( $ID -eq 'SPName' )
 #{
 #foreach ( $csv in $csvs )
 #{
 #$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType User -EntityId ($csv.SPID) -Permission r-x
 #Update-AzDataLakeGen2AclRecursive -Context $ctx -FileSystem $filesystemName -Path ($csv.Path) -Acl $acl
 #$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType User -EntityId ($csv.SPID) -Permission r-x -InputObject $acl -DefaultScope
 #Update-AzDataLakeGen2AclRecursive -Context $ctx -FileSystem $filesystemName -Path ($csv.Path) -Acl $acl
 #Write-Host ("Updated storage account '$(gskpscstgacc)' with FileSystem  '$filesystemName' under the Path '$($csv.Path)' with SP Name") -Separator " -> " $csv.SPName
 #}
 #}
 #else
 #{
 #Write-Host ("Invalid Template")
 #}
 }

