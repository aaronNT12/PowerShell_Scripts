param(
    [Parameter(Mandatory=$true)]
    [string]$Hostname,
    [switch]$Restart,
    [switch]$WhatIf
)

#Cambia el nombre del equipo

Rename-Computer -NewName $Hostname -Force -Verbose


#Si se pasa -WhatIf, solo informa de lo que haría
if ($WhatIf) {
    Write-Host "El equipo se renombraría a '$Hostname'."
}

#Si se pasa el parametro -Restart, reinica sin preguntar

if ($Restart) {
    Restart-Computer -Force

    <# Action to perform if the condition is true #>
}

