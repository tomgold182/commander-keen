
Function New-ScheduledTaskFolder

    {

     Param ($taskpath)

     $ErrorActionPreference = "stop"

     $scheduleObject = New-Object -ComObject schedule.service

     $scheduleObject.connect()

     $rootFolder = $scheduleObject.GetFolder("\")

        Try {$null = $scheduleObject.GetFolder($taskpath)}

        Catch { $null = $rootFolder.CreateFolder($taskpath) }

        Finally { $ErrorActionPreference = "continue" } }

    

Function Create-AndRegisterApplogTask

{

 Param ($taskname, $taskpath)
 $scriptPath="C:\locksystem.ps1"
 $action = New-ScheduledTaskAction -Execute 'Powershell.exe' ` -Argument "-executionpolicy bypass -noprofile -file $scriptPath"

 $now=(get-date).AddMinutes(1).ToString("HH:mm")
 $trigger =  New-ScheduledTaskTrigger -Once -At $now

 Register-ScheduledTask -Action $action -Trigger $trigger -TaskName ` $taskname -Description "Locks the machine due to Suspicious activty" -TaskPath $taskpath

}

 

Function Create-NewApplotTaskSettings

{

 Param ($taskname, $taskpath)

 $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries ` -Hidden -ExecutionTimeLimit (New-TimeSpan -Minutes 5) -RestartCount 3

 Set-ScheduledTask -TaskName $taskname -Settings $settings -TaskPath $taskpath

}

### ENTRY POINT ###

$taskname = "Lock System"

$taskpath = "SOC3D Tasks"

If(Get-ScheduledTask -TaskName $taskname -EA 0)

  {Unregister-ScheduledTask -TaskName $taskname -Confirm:$false}

New-ScheduledTaskFolder -taskname $taskname -taskpath $taskpath

Create-AndRegisterApplogTask -taskname $taskname -taskpath $taskpath | Out-Null

Create-NewApplotTaskSettings -taskname $taskname -taskpath $taskpath | Out-Null