$Domain = ‘adatum.local’
$hostname = Read-Host “Nombre del equipo”
Rename-Computer $hostname
Add-computer -domainname $Domain -Credential “adatum\administrator” -newname $hostname -Restart