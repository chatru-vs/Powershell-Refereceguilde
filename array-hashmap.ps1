#List the providers available
Get-psprovider
#List Powershell Drives
get-psdrive
set-location cert:
Get-childitem

set-location cert:\localmachine

# create Arrays
$NewArray = "a","b","c","d","e"
$NewArray.Gettype()
#create empty array
$EmptyArray = @()
$Numbers = @(1,2,3,4,5)


$Number = 1,2,3,4,5,6,7,8,9,10
$Number.count
#expend array and add element
$Numbers += 11 

#expend array and add another element

$Numbers += 12

$Numbers = 1,2,3,4,5,6,7,8,9,10

$Numbers2 = $Numbers
$Numbers2[0] = 99

# Create Hash Table

$HashTable = @{"A"=1;"B"=2;"C"=3}
$HashTable.gettype()
#add entry to hashtable
$HashTable["D"] = "4"
#change to hashtable
$HashTable["C"] = "6"

Copy-Item C:\powershellTutorial\lesson2.ps1
Move-Item C:\powershellTutorial\lesson2.ps1

Get-Service | Where-Object {$_.status -eq "stopped"} | ConvertTo-Html Name, Status | Set-Content C:\powershellTutorial\stopped.html
Get-Service | Where-Object {$_.status -eq "stopped"} | ConvertTo-Html Name, Status | Set-Content C:\powershellTutorial\stopped.html

Get-Service | Where-Object {$_.status -eq "stopped"} | Export-CSV C:\powershellTutorial\stopped.csv

Get-Service | Where-Object {$_.status -eq "stopped"} | Export-clixml C:\powershellTutorial\stopped.csv


