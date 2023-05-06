$cred= Get-Credential -Credential Contoso\ServiceAccount

# Map NAS shares to drive
New-PSDrive -Name "U" -Root "\\192.168.3.4\Backup" -Persist -PSProvider "FileSystem" -Credential $cred

# Add shortcut to desktop
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Backup (CASABOLLA).lnk")
$Shortcut.TargetPath = "U:"
$Shortcut.Save()