# Customize taskbar, desktop icons, start menu


# Start and taskbar customize
# 1. import Custom layout to C:\Users\%username%\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml
## NOT WORKING WITHOUT GROUP POLICY EDIT OR NEW USER CREATION

#######################################
##   Explorer, Start menu, Taskbar   ##
#######################################

# Enable dark theme
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name AppsUseLightTheme -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name SystemUsesLightTheme -Value 0
# Disable Recent app in start folder
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Start_TrackProgs -Value 0
# Hide Cortana Button
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name ShowCortanaButton -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name OnboardUnpinCortana -Value 1
# Hide People icon in taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name PeopleBand -Value 0
# Hide Task View button in taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name ShowTaskViewButton -Value 0
# Hide frequent and recent files from Quick Access
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name ShowRecent -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name ShowFrequent -Value 0
# Show hidden files in File Explorer
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1
# Show default desktop icons


# Control Panel view as categories
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" -Name StartupPage -Value 0



# Pin Programs to taskbar by adding link to %appdata%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar