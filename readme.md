# wslShellExtension

![sample screenshot of right click menu with this shell extension setup](sample.png?raw=true)

As of January 27 2020, the windows terminal project (https://github.com/microsoft/terminal) supports cmdline options for launching with a specific profile or working dir.<br>

This ps1 script installs a right click menu for wsl and powershell that use this terminal (need to build from source for now)<br>

You'll probably have to modify the paths to where you build terminal.

Note I couldn't find a repeatable path for the ubuntu ico, so I just downloaded one and threw it here.

## Instructions

Create an env var named WinTerm_Dev that points to where you cloned the terminal project

For Example: C:\Dev\terminal\

Run the ps1 in an elevated prompt.

Optionally, pin the provided shortcuts to start or taskbar.


