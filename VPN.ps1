### Setup OpenVPN for Windows and import files

If ((!Test-Path C:\Program Files\OpenVPN\bin\openvpn-gui.exe)){
    Write-Host "OpenVPN GUI not installed, skipping..."
    return $false;
}

$Path="$env:userprofile\OpenVPN\config"

If (!(Test-Path $Path)) {
    Write-Host "OpenVPN path was not found, Creating..."
    New-Item -Path $Path -Force -ErrorAction Stop | Out-Null
}

# Copy configuration from NAS to OpenVPN folder
$NAS_src= Get-PSDrive | findstr "Public" | ForEach-Object {($_ -split ' ')[0]}
robocopy "$NAS_src :\Filippo\dotfiles_backup\vpn_config\filippo.ovpn" "$path"