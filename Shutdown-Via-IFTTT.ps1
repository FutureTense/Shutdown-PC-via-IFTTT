#Declare Variables
$SearchDirectory = "D:\Dropbox\IFTTT\"
$CommandFile = "$SearchDirectory\cmd.txt"
$SleepTime = 5

Do {

#Removes the file from the directory, in case the file was not deleted. Sets the error action in case the file is not present.
Remove-Item -Path $CommandFile -Force -ErrorAction SilentlyContinue

#Loop checking to see if the file has been created and once it has it continues on. Sleep in the look to prevent CPU pegging
Do {
Start-Sleep -Seconds $SleepTime
$FileCheck = Test-Path -Path $CommandFile
}
Until ($FileCheck -eq $True)

$IFTT= Get-Content $CommandFile -First 1

#Removes the shutdown file to prevent an imediate shutdown when the computer starts back up
Remove-Item -Path $CommandFile

#Shuts the computer down forcefully but gracefully
#Stop-Computer -Force

$TS = Get-Date -Format G


switch ( $IFTT )
{
    Reboot
    {
       $PSscript = "D:\Dropbox\PowershellScripts\RebootNUC.ps1"
    }
    Shutdown
    {
       $PSscript = "D:\Dropbox\PowershellScripts\ShutdownVbox.ps1"
    }
    default 
    {
       $PSscript = 'unknown'
    }
}


$numTabs = 8

"$IFTT, $PSscript, $TS" | Out-File "$SearchDirectory\log.txt" -Append 

if (Test-Path $PSscript) 
{
    & $PSscript
}
else {"No script"}

 
} while (1)