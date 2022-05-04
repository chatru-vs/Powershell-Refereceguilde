#equals operator
"Powershell" -eq "powershell"

#not equals operator
"POWERSHELL" -ne "powershell"

#case sensitive equals
"Powershell" -ceq "powershell"

#case insensitive equals
"PowarShell" -ieq "powershell"

#greter then
4 -gt 4

#greter than or equals
3 -ge 3
#less then
3 -lt 7
#less then and equals
7 -le 4

#using operators on strings
"Reed" -gt "Read"
"k" -lt "g"
"powershell" -le "POWERSHELL"
"user" -cge "USER"

#USED against array or strings
"foo","bar","baz","qux" -eq "foo"
"foo","bar","baz","qux" -nq "foo"
"foo","bar","baz","qux" -contains "foo"
"foo","bar","baz","qux" -notcontains "foo"

gci | Select Name, @{Name="Size(MB)";Expression={[Math]::Round($_.Length/1MB,2)}}   # 1MB, !GB,  1TB
# Get process where object
Get-Process | Where {$_.WS -gt 15MB} |Sort WS | FT id, Name, WS -Autosize
Get-Process | Where {$_.WS -gt 15MB} | Sort WS | FT -Property Id, Name, WS -Autosize
Get-process | Select ID, Name, CPU, WS | Sort-Object WS

"foo","bar","baz","qux","def","TEMP" | Sort-object -CaseSensitive

"foo","bar","baz","qux","def","TEMP" | Sort-object -Unique

"foo","bar","baz","qux","def","TEMP" | Group-Object

get-contant c:\sample.txt

# Export to CSV, HTML, XML
Get-Process | Export-CSV C:\Users\chatrughan\Documents\process.csv
Get-Process | ConvertTo-HTML > C:\Users\chatrughan\Documents\process.html
Get-Process | Export-clixml > C:\Users\chatrughan\Documents\process.xml

#Open File
invoke-item C:\Users\chatrughan\Documents\process.html

