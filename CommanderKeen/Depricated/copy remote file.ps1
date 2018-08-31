$Username = 'c4internal\Maayanm'
$Password = 'Mm123456!'
$pass = ConvertTo-SecureString -AsPlainText $Password -Force


# Users you password securly
$MySecureCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username,$pass


$Session = New-PSSession -ComputerName 10.8.2.11 -Credential $MySecureCreds
#Copy-Item -Path "C:\Tom's Code\PS Moudule\locksystem.ps1" -Destination C:\locksystem.ps1 -ToSession $session
Copy-Item -Path "C:\Tom's Code\PS Moudule\createLocketST.ps1" -Destination C:\createLocketST.ps1 -ToSession $session