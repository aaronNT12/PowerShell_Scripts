# Configuración de variables
$DomainName = "liceo.local"  # Nombre de tu dominio
$AdminUser = "administrador"     # Usuario administrador del dominio
$AdminPassword = "TuContraseña"  # Contraseña del usuario administrador
$DC2Name = "DC2"                 # Nombre del segundo controlador de dominio
$DC2IP = "192.168.1.2"           # Dirección IP del segundo DC
$DNSIP = "192.168.1.1"           # Dirección IP del servidor DNS principal

# Instalación de roles
Install-WindowsFeature -Name AD-Domain-Services, DNS -IncludeManagementTools

# Configuración de IP estática
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress $DC2IP -PrefixLength 24 -DefaultGateway "192.168.1.254"
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses $DNSIP

# Promoción a controlador de dominio
Install-ADDSDomainController -DomainName $DomainName -InstallDns -NoRebootOnCompletion
Restart-Computer

# Verificación de replicación
Test-Replication -TopoLogyBySite -Target $DC2Name -Source $DC1Name
