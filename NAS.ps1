# Mount NAS shares as network drives and login

$IP="192.168.3.4"
$HOSTNAME="CASABOLLA"

# Setup object to manage credentials and shortcuts
$cred= Get-Credential
$WshShell = New-Object -comObject WScript.Shell

### Map NAS shares to drive: -Scope Global to make result available to the OS instead of the script only ###

# Share Public
New-PSDrive -Name "Y" -Root "\\$IP\Public" -Persist -PSProvider "FileSystem" -Scope Global -Credential $cred
# Add shortcuts to desktop
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Public ($HOSTNAME).lnk")
$Shortcut.TargetPath = "Y:\"
$Shortcut.Save()

# Share Amministrazione
New-PSDrive -Name "X" -Root "\\$IP\Amministrazione" -Persist -PSProvider "FileSystem" -Scope Global -Credential $cred
# Add shortcuts to desktop
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Amministrazione ($HOSTNAME).lnk")
$Shortcut.TargetPath = "X:\"
$Shortcut.Save()
