-------------------INSTALAR_OPENSSH EN_WINDOWS_SEVER2022--------------------------

1º Ejecute el comando siguiente. La salida muestra True cuando es miembro del grupo administradores integrado.

(New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

2º Para instalar OpenSSH mediante PowerShell, ejecute PowerShell como administrador. Para asegurarse de que OpenSSH esté disponible, ejecute el siguiente cmdlet:

Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'

3º El comando debería devolver la siguiente salida si ninguno de los dos está instalado todavía:

Name  : OpenSSH.Client~~~~0.0.1.0
State : NotPresent

Name  : OpenSSH.Server~~~~0.0.1.0
State : NotPresent

4º Ambos comandos deben devolver la salida siguiente:

Path          :
Online        : True
RestartNeeded : False

5º Para iniciar y configurar OpenSSH Server para su uso inicial, abra un símbolo del sistema de PowerShell con privilegios elevados (haga clic con el botón derecho, ejecutar como administrador) y ejecute los comandos siguientes para iniciar sshd service:

# Start the sshd service
Start-Service sshd

# OPTIONAL but recommended:
Set-Service -Name sshd -StartupType 'Automatic'

# Confirm the Firewall rule is configured. It should be created automatically by setup. Run the following to verify
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
}



