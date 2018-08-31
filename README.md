     .'   \  \    \  \ `.
        /       \  \    \  \  '. 
       /\        |  |    |  |   \
      |  \       |  |    |  |    \
      |  /      _|__|____|__|__   \
      | /     /                \  | 
      |/      | <(=)>    <(=)> '  |
      |       |         _|     |  |
      | (|)   |  /\            |  |
      '       ' |  \____      /  ]
        '     '\ \_____/    .|  '
         '__,'  \_________.' |_/ 
                |____________\  ,.
              ,.              /\  \ 
            .`                ||   \
          .`                  ----\ \               
         /                    <== |, \         
        /                     <== | \_\
       '                      ---/     |      
       `._     /|                \____/         
       /  `-,./ |                 '
      /     /   |                 |        
     (______`'._|_________________|       

# Commander Keen #


Commander Keen is a Powerfull Remote Code & Commands execution built in powershell in order to perform AgentLess automated incident reponse actions

### About ###
* Created By Tom Goldberg
* Version 1.0

### Supported functionalities: ###

* LockRemoteMachine : Locks the target machine
* GetProcessList : Retrieves  a list of the current running processes on the target machin
* GetUsersList : Retrieves a list of the current logged in users to the target machine


### Setup ###

1. make sure that you hve the latest Powershell version installed
2. GIT clone the project.
3. On the target machine , open Powershell and performthe following command ( To harden security , you can use remoteSigned instead of Bypass but you will have to sign the scripts yourself) :
~~~ 
Enable-PSRemoting
Set-ExecutionPolicy Bypass 
~~~
4. Check your Trusted Hosts file by Executing the following Powershell command:
~~~
get-item wsman:\localhost\Client\TrustedHosts
~~~
5. If Your desired machines are not listed there , add them by executing ( After the -value ,put you network range) :
~~~
set-item wsman:\localhost\Client\TrustedHosts -value 10.8.*
~~~
	
 

## How To ##

#### Open CMD and run the Dispatcher.ps1 file with the appropriate arguments

### Arguments ###
1. -username : A useranme with the appropriate permissions
2. -password : Password that matches this user
3. -action : The desirred action (the options are dexcribed in the 'Supported functionalities' section
4. -ip : The target machine's IP address.

### Example ###

~~~
cd /CommanderKeen
powershell ./Dispatcher.ps1 -username some_user -password some_pass -action GetUsersList - ip 10.8.4.4
~~~
