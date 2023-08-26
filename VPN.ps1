### Setup OpenVPN for Windows and import files

If (!(Test-Path "C:\Program Files\OpenVPN\bin\openvpn-gui.exe")){
    Write-Host "OpenVPN GUI not installed, skipping..." -ForegroundColor Red
    return $false;
}

$config_path="$env:userprofile\OpenVPN\config\"

If (!(Test-Path $Path)) {
    Write-Host "OpenVPN path was not found, Creating..."
    New-Item -ItemType "directory" -Path $Path -Force -ErrorAction Stop | Out-Null
}

# Copy configuration from NAS to OpenVPN folder
$NAS_src= Get-PSDrive | findstr "Public" | ForEach-Object {($_ -split ' ')[0]}
robocopy "${NAS_src}:\Filippo\dotfiles_backup\vpn_config" "$config_path" filippo.ovpn
robocopy "${NAS_src}:\Filippo\dotfiles_backup\vpn_config\openvpn_ufficio" "$config_path" VPNConfig.ovpn