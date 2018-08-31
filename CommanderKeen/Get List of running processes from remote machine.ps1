$Username = 'c4internal\Maayanm'
$Password = 'Mm123456!'
$pass = ConvertTo-SecureString -AsPlainText $Password -Force


# Users you password securly
$MySecureCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username,$pass
Invoke-Command -Credential $MySecureCreds -ComputerName 10.8.2.11 -ScriptBlock {Get-Process}