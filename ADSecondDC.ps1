Install-WindowsFeature AD-Domain-Services -IncludeManagementTools -verbose

Install-ADDSDomainController -DomainName "dominio" -InstallDns:$true -NoGlobalCatalog: $false
-NoRebootOnCompletion:$true -Force:$true -SafeModeAdministratorPassword (ConvertFrom-SecureString 'contraseña' -AsPlainText -Force) -Credential (Get-Credential "dominio"\administrator) -verbose