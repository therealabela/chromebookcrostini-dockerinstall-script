# Docker Script | Linux
A simple Script that lets you install Docker easily using a short command that is easy to understand to a Linux user.

## How to install | Local
First, paste your .sh into your "Linux Files" folder.
Second, open a new terminal window and type the following command "chmod +x dockerinstallscript.sh", because newly created script files don't have permission to be executed as a program. You must add this permission using chmod.
After the command completes, type the following into the terminal "./dockerinstallscript.sh" and let my script "cook"! 

## How to install | curl
Before you continue, check if you have curl installed by running "curl" in a terminal window.
If you have curl installed, run the following command, **`curl -fsSL https://raw.githubusercontent.com/therealabela/unoffical-dockerinstall-script/main/dockerinstallscript.sh | sudo bash`**
## How the script "tests" if it installed correctly
After the script is finshed, the script will say "Verify Installation" before running Docker's "hello-world" test container. All you really need to do to check is after the "Verify Installation" line; if the output is good!
