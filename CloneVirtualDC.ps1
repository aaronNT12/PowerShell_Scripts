$maquina = (Get-ComputerInfo).CsCaption
$fix = ‘$’
$computer = $maquina + $fix
ADD-ADGroupMember “Cloneable Domain Controllers” –members «$computer»

Remove-Item -Path C:\Windows\NTDS*.xml -ErrorAction SilentlyContinue -Verbose
Write-host «»
Write-host «»

Get-ADDCCloningExcludedApplicationList -GenerateXml
Write-host «»

$name= Read-Host «Introduce el nombre de la máquina clon»
Write-host «»
$IPv4= Read-Host «Introduce la IP de la máquina clon»
Write-host «»
$mask= Read-Host «Introduce la máscara de subred de la máquina clon»
Write-host «»
$gw = Read-Host «Introduce la puerta de enlace de la máquina clon»
Write-host «»
$dns = Read-Host «Introduce el dns principal de la máquina clon»
Write-host «»
New-ADDCCloneConfigFile -CloneComputerName $name -IPv4Address $IPv4 -IPv4SubnetMask $mask -IPv4DefaultGateway $gw -IPv4DNSResolver $dns -static