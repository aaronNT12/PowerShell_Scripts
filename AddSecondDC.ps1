# Asegúrate de ejecutar este script con privilegios de administrador.

# Define las credenciales del administrador del dominio existente
$adminCred = Get-Credential

# Instala los roles de Servicios de dominio de Active Directory y Servidor DNS
Install-WindowsFeature -Name AD-Domain-Services, DNS -IncludeManagementTools

# Promueve el servidor a controlador de dominio
Install-ADDSDomainController `
    -DomainName "liceo.local" `
    -Credential $adminCred `
    -InstallDNS `
    -NoGlobalCatalog:$false `
    -CreateDnsDelegation:$false `
    -Force:$true

# Reinicia el servidor
Restart-Computer -Force

