param($Name,$ClearPassword,$Enable,$Group)
param([Parameter(Mandatory)][string]$Name,[string]$ClearPassword,[Boolean]$Enable=$true,[string]$Group)
$SecurePassword= ConvertFrom-SecureString $ClearPassword -AsPlainText -Force

#Crear usuario
New-ADUser -Name $Name -AccountPassword $SecurePassword -Enable -Force

#Añadir a grupo
Add-AdGroupMember -Identity $Group -Member $Name

Write-Host "Se ha anhadido el usuario $Name al grupo $Group"