This project was me learning PowerShell from scratch by creating a text-based game. The game is a mud-like environment in which you perform a penetration test in the headquarters of my employer, OGD ict-diensten.
  
To play the game:  
1) Download the game from this repository.  
2) Unzip the downloaded file to D:\Temp (or whatever location suits you).  
3) Open a PowerShell window with the following command: `powershell.exe -executionpolicy bypass`. This is to circumvent the default security policy that comes with PowerShell. For the best experience, maximize the screen (or allow at least 57 lines and 128 columns)
4) Import the module with the following command: `Import-Module D:\Temp\powerspell-master\PowerSpel-PenTest\PowerSpel-PenTest.psd1`  
5) Start the game with the following command: `Start-PowerSpelPenTest`  

The rest should be self-explanatory. Enjoy!

  
  
Designed by Jelle de Graaf  

Many many thanks to Thijs de Meester for building the framework to start from and endless patience with all my little questions about how to code something.  
Special mention of Frodo Bouw for also helping me with code I couldn't get quite right, fixing that with me and giving me an extra lesson about how that subject works in general.
