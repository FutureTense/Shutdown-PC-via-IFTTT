# Shutdown PC via IFTTT
A PowerShell script that looks for a file placed by IFTTT and if found shuts the computer down.

### Fork modifications

I modified this script to run infinitly in a loop.  With IFTTT I created a service with Google Assistant that uses "Say a phrase with an igredient" and configured it so that you can say something like `Ok Google, execute **shutdown**`.  You can replace `shutdown` with any word.  Inside the script it monitors the file `cmd.txt` which will contain the "ingredient" name.  In a switch statement it searches for a Powershell script that matches that ingredient and then executes it.

I also don't bother with creating the task beause my machine always auto-logins in.  And I run the script by putting a shortcut to my Powershell script in

   C:\Users\username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

## Setup

### In IFTTT
1. Create an IFTTT Applet with a "If This" service of your choice as the trigger. In my example I will use an Amazon Alexa trigger but you can use an Email or SMS to trigger the Applet just the same.
  1. <img src="http://i.imgur.com/hc2x9P7.png" width="480">
2. For the action service, choose a cloud storage platform of your choice (Dropbox, Google Drive, OneDrive, etc.) I've chosen Dropbox for my example for it's fast desktop sync and the ability to create text files directly with IFTTT. If this is the first time you've used the Dropbox service in IFTTT, you'll have to log in and connect your account.
3. Choose the "Create a text file" option.
4. For the file name, enter "cmd". For the content it can be anything it does not matter. And i've set it to place the file in the IFTTT folder in the root of the Dropbox folder.
  1. <img src="http://i.imgur.com/Bve9XJ2.png" width="400">
5. Optionally rename the applet and click "Finish"

### On your Computer
1. Download and log into the Dropbox Sync application if it is not already.
2. Create a holding place for the Powershell script, I will use "C:\Scripts\Shutdown-PC-via-IFTTT" as this is where I cloned the Git repository
3. Edit line 2 to contian the directory of where your IFTTT applet will place the text file in your Dropbox local sync folder
4. Edit line 3 to change the Sleeptime between file checks.
5. Open "Task Scheduler" and create a standard task
6. Give it a name and choose who you'd like to run it as and whether or not you'd like it to run when the computer is not logged in.
![Screenshot](http://i.imgur.com/GgJV3Vm.png)
7. Choose to run with highest privileges
8. Run the task hidden
9. On the triggers tab, create a new trigger for "At Startup"
![Screenshot](http://i.imgur.com/oL8hyOl.png)
10. On the actions tab, create a new action to start a program. For the program, enter "powershell.exe". For the Arguments box enter the path to the script file. For example: -file "C:\Scripts\Shutdown-PC-via-IFTTT\Shutdown-Via-IFTTT.ps1"
![Screenshot](http://i.imgur.com/Wp7ClIE.png)
11. Open an administrative powershell prompt and run `Set-ExecutionPolicy Unrestricted` and choose `A`
12. Run the task manually if you don't wish to reboot
13. Trigger your IFTTT applet to test
