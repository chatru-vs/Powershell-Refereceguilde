# Tast 2: Navigating the registry using windows powershell registry provider
#set location HKU
set-location hkcu:
get-location

#list contents
gci

#Navigate to path
sl software\microsoft\windows\currentversion\explorer
get-location

#navigate to different drive
sl hklm:\software\microsoft
get-location

# list contents of windows key
GCI hklm:\software\microsoft\windows

#get registry key
Get-Item hklm:\software\microsoft\windows

#serach for registry keys
Get-childitem HKLM:\software\microsoft\microsoft -recurs -include Windows --erroraction silentcontinue | ft *

#show details of object
Get-item hklm:\software\microsoft\winodws | Get-Member

# Get subkey name
(get-item hklm:\software\microsoft\windows).getsubkeyname()

#check for windows search
(get-item hklm:\software\microsoft\windows).getsubkeyname() -contains "windows search"

#set location to HKLM
sl HKLM:


#TASK 4 : Reading the registry properties

#Get registry values
Get-ItemProperty HKLM:\software\microsoft\powershell\1
#Assign to variable
$Regvalues = GP  HKLM:\Software\Microsoft\Powershell\1

#get PID Value
$regvalues.pid

#using getvalue methos
(Get-Itme HKLM:\software\microsoft\powershell\1).getvalue("pid")

# Task 5: Crating registry Keys

#create a registry key
new-item hkcu:\software\microsoft\myapplication

#create registry key using -path and -name
new-item -Path hkcu:\software -Name OurApplication

# set location
sl hkcu:\software

#create key from local path
New-Item yourApplication


#crete key form local path alternative
New-Item -Path . -Name hisApplication

sl HKCU:\software\Microsoft\officee\12.0\common\LanguageResources

#create Registry value
New-ItemProperty HKCU:\software\MyApplication -name "config1" -value "1024" -properyType DWOR

#Set Property Value
Set-ItemProperty -path HKCU:\software\MyApplication -name "config1" -value "2048"
#create registy value -force if already exists
New-ItemProperty -path HKCU:\software\MyApplication -name "config1" -value "4096" -force

#remove registey key

remove-item HKCU:\software\MyApplication

#Open remote registry key
$RemoteReg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey("Localmachine", "sysxxxx")

#get subkey via method
$dotnetreg = $RemoteReg.Open.Sub.key("software\Microsoft\net framwork setup"\NDP\v2.0.50727)
#display properties
$dotnetreg

# testing remote registry key existance
$RemoteReg.GetSubKeyNames()

#Get Powershell reg key
$psreg = $RemoteReg.OpenSubKey("Software\Microsoft\Powershell\1")

# check for key exits
$psreg.getsubkeyname() | where {$_ -eq "ShellIds"}

# Reding remote registry

#get value names
$psreg.GetValueNames()

# Get Pid Value
$psreg.GetValue("pid")

# Get value names, get each value
$psreg.GetvalueNames() | foreach-object {"$_ : $($psreg.getvalue($_))"}


#creating remote registry key
$RemoteReg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey("Localmachine", "sysxxxx")

#Open Key for writing
$MSReg = $RemoteReg.OpenSubKey("Software\Microsoft\", $true)

#creat remote key
$MSReg.CreateSubKey(MSData)

#open remote registy key for writing
$MSDataReg = $RemoteReg.OpenSubKey("Software\Microsoft\", $true)
#Set Value
$MSDataReg.setvalue("state", "1", "Dword")

# Modifying remote registry properties
#get value
$MSDataReg.getvalue("state")
#set value
$MSDataReg.getvalue("state" "2", "Dword")

#delete key
$MSReg.deleteSubKey("MSData")


#Get eventlog cmdlets
gcm *-eventlog -CommandType cmdlet

#list eventlogs
Get-eventlog -list | gm
