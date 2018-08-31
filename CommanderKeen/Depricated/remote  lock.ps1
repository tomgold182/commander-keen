
$sb={
Function Lock-WorkStation { 
#Requires -Version 2.0 
$signature = @" 
[DllImport("user32.dll", SetLastError = true)] 
public static extern bool LockWorkStation(); 
"@ 
 
$LockWorkStation = Add-Type -memberDefinition $signature -name "Win32LockWorkStation" -namespace Win32Functions -passthru 
$LockWorkStation::LockWorkStation() | Out-Null 
}
Lock-WorkStation
}

Invoke-Command -ScriptBlock $sb

$Username = 'c4internal\yotamm'
$Password = 'Aa123456!'
$pass = ConvertTo-SecureString -AsPlainText $Password -Force


# Users you password securly
$MySecureCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username,$pass

#Enter-PSSession -ComputerName 10.8.1.11  -Credential $MySecureCreds 


Invoke-Command -ComputerName 10.8.1.11 -Credential $MySecureCreds -FilePath C:\Temp\locksystem.ps1

Invoke-Command -ScriptBlock $sb
