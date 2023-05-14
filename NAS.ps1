# Mount NAS shares as network drives and login

$IP="192.168.3.4"

# Setup object to manage credentials and shortcuts
$cred= Get-Credential -Credential
$WshShell = New-Object -comObject WScript.Shell

# Map NAS shares to drive: -Scope Global to make result available to the OS instead of the script only
New-PSDrive -Name "U" -Root "\\$IP\Backup" -Persist -PSProvider "FileSystem" -Scope Global -Credential $cred
# Add shortcuts to desktop
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Backup (CASABOLLA).lnk")
$Shortcut.TargetPath = "U:\"
$Shortcut.Save()
