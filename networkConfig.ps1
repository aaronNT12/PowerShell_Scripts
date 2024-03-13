param($InterfaceAlias, $IPAddress, $PrefixLength, $Gateway, $DNSServers)

# Eliminando configuración existente
Remove-NetIPAddress -InterfaceAlias $InterfaceAlias -Confirm:$false
Set-NetIPInterface -InterfaceAlias $InterfaceAlias -Dhcp Disabled
Remove-NetRoute -IfAlias $InterfaceAlias -ErrorAction SilentlyContinue -Confirm:$false

if ($Gateway) {
    New-NetIPAddress -InterfaceAlias $InterfaceAlias -IPAddress $IPAddress -PrefixLength $PrefixLength -DefaultGateway $Gateway | Out-Null
}
else {
    # Acción cuando todas las condiciones if y elseif son falsas
    New-NetIPAddress -InterfaceAlias $InterfaceAlias -IPAddress $IPAddress -PrefixLength $PrefixLength | Out-Null
}

if ($DNSServers) {
    Set-DnsClientDohServerAddress -InterfaceAlias $InterfaceAlias -ServerAddresses $DNSServers -Confirm:$false
}

    



