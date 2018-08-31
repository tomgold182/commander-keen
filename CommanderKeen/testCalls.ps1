$username="maayanm"
$password="Mm123456!"
$ip="10.8.2.11"
$securePass = ConvertTo-SecureString -AsPlainText $password -Force
$SecureCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username,$securePass
Invoke-Command -Credential $SecureCreds -ComputerName $ip -ScriptBlock {Get-Process}
