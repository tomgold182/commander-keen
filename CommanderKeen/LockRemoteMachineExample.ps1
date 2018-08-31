set-item wsman:\\localhost\\Client\\TrustedHosts 10.8.1.11



#$Username = 'c4internal\Maayanm'
#$Password = 'Mm123456!'
$Username = 'c4internal\yotamm'
$Password = 'Aa123456!'
$pass = ConvertTo-SecureString -AsPlainText $Password -Force


# Users you password securly
$MySecureCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username,$pass


#Enter-PSSession -ComputerName 10.8.2.11  -Credential $MySecureCreds 

#Invoke-Command -Credential $MySecureCreds -ComputerName 10.8.2.11 -FilePath "C:\Tom's Code\PS Moudule\LockRemoteMachine.ps1"
Invoke-Command -Credential $MySecureCreds -ComputerName 10.8.1.11 -FilePath "C:\Tom's Code\PS Moudule\LockRemoteMachine.ps1"
#Invoke-Command -ComputerName 10.8.2.11 -FilePath "C:\Tom's Code\PS Moudule\LockRemoteMachine.ps1"
