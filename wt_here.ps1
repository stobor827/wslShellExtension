class WTInfo{
    [string]$caption
    [string]$iconPath
    [string]$wtProfile
    [string]$regKeyName
}

$wtPath = "$($env:WinTerm_Dev)src\cascadia\CascadiaPackage\bin\x64\Release\AppX\WindowsTerminal.exe"

$wtShortcuts = @(
    [WTInfo]@{
        caption='Open WSL(Ubuntu) here';
        iconPath="C:\Dev\wslShellExtension\ubuntu.ico";
        wtProfile= 'Ubuntu';
        regKeyName='WT_Ubuntu';
    }
    [WTInfo]@{
        caption='Open Powershell here';
        iconPath='powershell.exe';
        wtProfile="Windows PowerShell";
        regKeyName='WT_Powershell';
    }
)

$locations = 
    "Registry::HKCR\Directory\Background\shell\",
    "Registry::HKCR\Directory\shell\",
    "Registry::HKCR\Drive\shell\",
    "Registry::HKCR\LibraryFolder\Background\shell\"


foreach($key in $locations){
    foreach($elem in $wtShortcuts){
        Echo "Adding $($elem.wtProfile) to $($key)";
        New-Item -Path $key -Name $elem.regKeyName -Force | Out-Null
        Set-ItemProperty -Path "$($key)$($elem.regKeyName)" -Name "(Default)" -Value $elem.caption
        Set-ItemProperty -Path "$($key)$($elem.regKeyName)" -Name "Icon" -Value $elem.iconPath
        
        #One of my prior scripts had this, but I don't know what it does.
        #Set-ItemProperty -Path "$($key)$($elem.regKeyName)" -Name "Extended" -Value "-"
        
        $cmd = "$($wtPath) -d `"%V`" -p `"$($elem.wtProfile)`""
        New-Item -Path "$($key)$($elem.regKeyName)" -Name "command" -Force | Out-Null
        Set-ItemProperty -Path "$($key)$($elem.regKeyName)\command" -Name "(Default)" -Value $cmd

        #Echo "$($key)$($elem.regKeyName)"
        #Echo "$($wtPath) -p $($elem.wtProfile) -d %V"
        
    }
    
    
}