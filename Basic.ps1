# list the current processes
get-process | format-table name, ws, VirtualMemorySize -AutoSize
# List the services on the system
get-service
# get information for just the bits service
get-service bits
#Generate a random number between 1 to 10
Get-random -Minimum 1 -Maximum 10

get-service > service.txt
systeminfo > syteminfo.txt
#run multiple commands seprate by ;

ipconfig /all > systemconfig.txt; systeminfo >> systeminfo.txt; get-service >> systemconfig.txt; notepad systeminfo.txt

# Get process with parameter
Get-process -name explorer
# Get multiple process

Get-process -name explorer,system,wmiprvse
#List DLL
Get-Process -name explorer -Module
Get-Process -name explorer -Module > explorer.txt

# Member Details
Get-Service | Get-Member
#Using inputobject
Get-member -InputObject (get-service)
#count members
 Get-service | Get-member | Measure-Object -Property MemberType
 #List only properties
 Get-service | Get-Member -MemberType property
 #List only members
 Get-service | Get-Member -MemberType method
 
 # Access object members
 # Assign object to a variable
 $ALGService = Get-Service -Name alg
 $ALGService.DisplyaName
 $ALGService.Start()
 $ALGService.Refresh()
 
 Get-ChildItem -Path c:\windows | Sort-object -Property LastWriteTime
 Get-ChildItem -Path c:\windows | Sort-object -Property Length -Descending
 
 # Get process greter then 500 handles
 Get-Process | Where-Object ($_.handles -gt 500)
 Get-Process | Where ($_.handles -gt 500)
 # Get total size of directory
 Get-ChildItem -Path 'C:\Users\chatrughan\Pictures\BootDemoApp' -Recurse | Measure-Object -Property length -sum
 
 "C:\Users\chatrughan\Pictures\BootDemoApp"
 # get process object
 $process = gps -Name lsass
 #list property
 $process.Threads
 #add a property to an object
 Add-Member -InputObject $process -MemberType scriptproperty -Name ThreadsCount -Value {$this.Threads.Count} -PassThru
 $process | gm
 $process.ThreadsCount
 
