# IdleLogout

This is a swift rebuild of previous Idle Logout app written for Penn State Labs. This veresion mimics the previous version, with the addition of a drop down to choose the length of time the user would like to remain idle.

## Below is the previous repo documentation. This repo can utilize the helpful parts.


Description
------------
Application to log out users after a specified period of time. The user will see a prompt with a countdown asking them if they wish to log out or continue working ("More Time"). Users can disable the Idle Logout process using the "Disable Idle Logout.applescript". Remote Control (VNC/ARD over port 5900) will block the logout process unless SkipRemoteControlCheck is set to True in the preference file. A optional script can be run before a user is logged out.

**The Idle Logout App will force close any applications the user has open. This will not save any data!**

Screen Shot of Count Down Window:
![window]

Download latest package: [Idle Logout.app](https://git.psu.edu/sysman/IdleLogout/tree/master/IdleLogout%20Builds)

Installation
-------------

The IdleLogout-V.v.pkg installs the Idle Logout.app into /Library/CLMshared/Startup Items/ and the [LaunchAgent](https://git.psu.edu/sysman/IdleLogout/blob/master/IdleLogout%20Builds/LaunchAgent/edu.psu.idlelogout.plist) to open it in /Library/LaunchAgents/.

The Idle Logout.app will write log files into the /Users/Shared/IdleLogout/ folder.

You can deploy the "Disable Idle Logout.applescript", as a compiled app, to give users an easy way to stop the Idle Logout process. This is helpful in locations where users need to allow processes to run for longer than you're normal logout time.


Preferences
-------------
The Idle Logout.app looks for the preference file "/Library/Preferences/edu.psu.idlelogout.plist" (included in the repo under '[IdleLogout Builds/Preference/](https://git.psu.edu/sysman/IdleLogout/blob/master/IdleLogout%20Builds/Preference/edu.psu.idlelogout.plist)' folder). It looks for the following key/string pairs in the plist. If they are missing, it will use the defaults:

* IgnoreUser = Ignore the username, don't force logout.
* IgnoreGroup = Ignore anyone in this group, don't force logout.
* ComputerIdleAfterNumSeconds = Number of seconds before considering the computer abandoned.
* IdleLoopDelaySeconds = Number of seconds to wait between checking the usb idle seconds.
* WaitForUserPromptSeconds = Number of seconds to wait for user to respond to logout prompt.
* WindowTitle = Changes the name shown in the logout window. Uses String.
* WindowMessage = Changes the text shown on the logout window. Uses String.
* SkipRemoteControlCheck = Skips ARD check and logs out if TRUE.
* LogOutScriptPath = Run a script before user is logged out. Can be any script the terminal supports.

Default Values if plist is not installed:

* IgnoreUser = "macadmin"
* IgnoreGroup = "admin"
* ComputerIdleAfterNumSeconds = "600"
* IdleLoopDelaySeconds = "30"
* WaitForUserPromptSeconds = "90"
* WindowTitle = "PSU Idle Logout"
* WindowMessage = "This Mac is idle.\n\nClick the \"More Time\" button to continue using the Mac.\n\nOtherwise, an automatic logout will occur and all unsaved documents will be LOST!"
* SkipRemoteControlCheck = False
* LogOutScriptPath = None

Defaults can be set quickly for all users using defaults write:

* defaults write /Library/Preferences/edu.psu.idlelogout.plist IgnoreUser -string clcclmadmin
* defaults write /Library/Preferences/edu.psu.idlelogout.plist IgnoreGroup -string user
* defaults write /Library/Preferences/edu.psu.idlelogout.plist ComputerIdleAfterNumSeconds -string 10
* defaults write /Library/Preferences/edu.psu.idlelogout.plist IdleLoopDelaySeconds -string 5
* defaults write /Library/Preferences/edu.psu.idlelogout.plist WaitForUserPromptSeconds -string 120
* defaults write /Library/Preferences/edu.psu.idlelogout.plist WindowTitle -string "Our Idle Logout"
* defaults write /Library/Preferences/edu.psu.idlelogout.plist WindowMessage "You're going to be logged out\n\n\nDude\!"
* defaults write /Library/Preferences/edu.psu.idlelogout.plist SkipRemoteControlCheck -bool FALSE
* defaults write /Library/Preferences/edu.psu.idlelogout.plist LogOutScriptPath -string "/path/to/script.sh"

Background
------------
Idle Logout.app was written in Xojo 2015 R3. It uses the ioreg command to determine how long USB devices have been idle. Once the idle limit is meet, the computer is forcibly restarted to log out any users.

The terminal command we use to check idle seconds on USB devices is:
> /bin/echo $((`/usr/sbin/ioreg -c IOHIDSystem | /usr/bin/sed -e '/HIDIdleTime/ !{ d' -e 't' -e '}' -e 's/.* = //g' -e 'q'` / 1000000000))

ToDo
-------------
* Build the app

Completed
------------


Attribution
------------
Application Icon modified from original, used with CC license:
From http://www.flickr.com/photos/23453447@N02/5107438855/sizes/o/in/photostream/
By zyrquel: http://www.flickr.com/photos/23453447@N02/

Full Screen Shot of Countdown Window:
![full]

[full]: https://git.psu.edu/sysman/IdleLogout/raw/master/IdleLogout%20Builds/screenshots/full.png "Full Screen Shot"
[window]: https://git.psu.edu/sysman/IdleLogout/raw/master/IdleLogout%20Builds/screenshots/window.png "Windowed Screen Shot"
