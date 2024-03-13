PS> $key = “HKLM:\SOFTWARE\Microsoft\PowerShell\1\ShellIds”
PS> Set-ItemProperty $key ConsolePrompting True
PS> Get-Credential