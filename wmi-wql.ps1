#list execution policy option
get-executionpolicy -list

set-executionpolicy unrestricted

Do while and do until
for and foreach
break and continue
Return and exit

get-module -ListAvailable
Import-Module Activedirectory

Get-Command -Module "ActiveDirectory"

#open wmi management
wmimgmt.msc
#use sc to view service info
sc.exe QC WINMGMT
sc.exe QUERYEX WINMGMT

get-service winmgmt | fl *

# List Wmi Namespaces
gwmi -class __namespace -namespace root | select name

# List WMI classes
Get-wmiobject -list
Get-wmiobject -list | select name
Get-wmiobject -list | select name > wmi.txt

#Understand WMI Metadata
Get-wmiobject -list | where-object {$_.name -like "win32_*" -and $_.name -notlike "Win32_Perf*"}
Get-wmiobject -class "Win32_LogicalDisk"
Get-wmiobject -class "Win32_Bios" | fl *

Get-wmiobject Win32_Service -filter "name='netlogon'" | fl *
#List WMI Method
Get-wmiobject -List * | Where-Object{$_.Methods -ne $Null} | Select-Object -ExpandProperty Methods | Sort-object Orgin,Name | Select-Object Orgin,Name -Unique
#Count Methods
(Get-wmiobject -List * | Where-Object{$_.Methods -ne $Null} | Select-Object -ExpandProperty Methods | Sort-object Orgin,Name | Select-Object Orgin,Name -Unique).count

#list wmi class using defualts
Get-wmiobject win32_computersystem

Get-wmiobject -namespace root\cimv2 win32_computersystem

Get-wmiobject -class win32_process


Get-wmiobject -namespace root\cimv2 -class win32_share

#use a WQL Query
Get-WmiObject -Query "Select name, startmode, state from win32_service" | format-list [a-z]*
Get-WmiObject -q

#using where object
Get-WmiObject Win32_Service | where-object {$_.name -eq "netlogon"}

# WQL where
Get-WmiObject -Query 'Select name from win32_service where name like "n%" and state="running"' | ft name
Get-WmiObject -Query 'Select name from win32_service where name like "s%" and state="running"' | ft name
Get-WmiObject -Query 'Select name from win32_service where name like "s%" and state="stopped"' | ft name
Get-WmiObject -query "select * from Win32_OptionalFeature where name = 'TelnetClient'"

#using filter option
gwmi win32_service -filter 'name = "netlogon"'

#get bio info from remote host
Get-WmiObject -Computername "XXXXXX" -class Win32_Bios
#Refading ACL
get-acl $env:windir | ft -AutoSize -Wrap
(get-acl c:\windows).access | ft -wrap

# get web request
(Invoke-WebRequest 'http://myip.dnsomatic.com' -UseBasicParsing).Content
