param(
    [Parameter(Position = 0)]
    [string]$username,
    [string]$password,
    [string]$action,
    [string]$IP
    )

Write-Debug "Params are: $username $password $action $ip"
###Authentication###
$securePass = ConvertTo-SecureString -AsPlainText $password -Force
$SecureCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username,$securePass

###Actions###
switch ($action)
{
'LockRemoteMachine' {Invoke-Command -Credential $SecureCreds -ComputerName $ip -FilePath $PSScriptRoot\MachineLocker.ps1}
'GetProcessList' {Invoke-Command -Credential $SecureCreds -ComputerName $ip -ScriptBlock {Get-Process}}
'GetUsersList'{Get-WmiObject  -Credential $SecureCreds -ComputerName $ip –Class Win32_ComputerSystem | Select-Object UserName}
}
