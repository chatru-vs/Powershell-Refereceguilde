#Define parameters
Param(
    $userName,
    $homePath
)
Write-Host $userName
Write-host $homePath

#define parameter data type
Param(
    [string]$userName,
    [string]$homePath
)
Write-Host $userName
Write-host $homePath


#Define mandotory parameter
Param(
    [Parameter(Mandatory=$True)]
    [string]$userName,
    [Parameter(Mandatory=$True)]
    [string]$homePath

)
Write-Host $userName
Write-host $homePath
#Define parameters with position
Param(
    [Parameter(Mandatory=$True, Position=1)]
    [string]$userName,
    [Parameter(Position=0)]
    [string]$homePath

)
Write-Host $userName
Write-host $homePath

