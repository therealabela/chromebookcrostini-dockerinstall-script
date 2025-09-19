# Docker Script for ARM64 Chromebooks |  Linux Crostini
A simple Debian Script that lets you install Docker on Crostini (ARM CHROMEBOOKS) easily using a short command that is easy to understand to a Linux user.

## How to install
First, paste your .sh (assuming you have setup Linux Crostini) into your "Linux Files" folder, this is so Crostini has the file.
Second, open a new terminal window and type the following command "chmod +x dockerforarm64chromebooks.sh", because newly created script files don't have permission to be executed as a program. You must add this permission using chmod.
After the command completes, type the following into the terminal "./dockerforarm64chromebooks.sh" and let my script "cook"! 

## How the script "tests" if it installed correctly
After the script is finshed, the script will say "Verify Installation" before running Docker's "hello-world" test container. All you really need to do to check is after the "Verify Installation" line; if the output is good!
