# taskbar.ps1
# Add programs to taskbar by applying a custom start layout (also sets start layout options)
# After that both start menu and taskbar can be further modified (registry reset would restore previously generated custom layout)

# Copy custom layout to the user config folder
$shell_path="$env:userprofile\AppData\Local\Microsoft\Windows\Shell"
Copy-Item "LayoutModification.xml" -Destination $shell_path

# Reset Start menu present settings
Remove-Item -Force -Recurse -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount"
# Reset Taskbar present settings
Remove-Item -Force -Recurse -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband"

# Restart Explorer to apply changes
Get-Process explorer | Stop-Process

Write-Host "Start and taskbar layout have been applied. 
If modification on the device are made, make sure to update the layout model accordingly!" -ForegroundColor Yellow