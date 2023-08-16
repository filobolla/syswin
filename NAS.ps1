# Mount NAS shares as network drives and login

$IP="192.168.3.4"
$hostname="CASABOLLA"
$mnt_shares=@(
    "Public"
    "Amministrazione"
    "Backup"
)

$drive_list=(Get-PSDrive -PSProvider filesystem)
$drive_letters="ZYXWVUTSRQPONMLKJIHGFED".ToCharArray()

# Setup object to manage credentials and shortcuts
#$cred= Get-Credential
#$WshShell = New-Object -comObject WScript.Shell

ForEach ($share in $mnt_shares){
    Write-Host "Mounting \\$IP\$share..."
    # Skipping paths already mounted
        if ($drive_list.DisplayRoot -contains "\\$IP\$share"){
            Write-Host -ForegroundColor "Yellow" "Share already mounted at" ($drive_list | where {$_.DisplayRoot -contains "\\$IP\$share"}).Root ", skipping..."
        }
        else {
            foreach ($letter in $drive_letters) {
                # Find the first available letter
                if ($drive_list.Name -notcontains $letter){
                    Write-Host "Available letter: $letter" -ForegroundColor "Green"
                    # Map NAS shares to drive: -Scope Global to make result available to the OS instead of the script only
                    New-PSDrive -Name "$letter" -Root "\\$IP\$share" -Persist -PSProvider "FileSystem" -Scope Global #-Credential $cred
                    break
                }
            }
        }
}

# Add shortcuts to desktop
#$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Backup (CASABOLLA).lnk")
#$Shortcut.TargetPath = "U:\"
#$Shortcut.Save()
