# Feature install/uninstall
# Features to install: Hypervisor, WSL2, Windows media player
# Features to uninstall: Internet explorer 11, Telnet

$features_install=@(
# Microsoft print to PDF
    "Printing-PrintToPEDServices-Feature"
# Legacy media
    "WindowsMediaPlayer"
    "MediaPlayback"
    "DirectPlay"
    "LegacyComponents"
# Windows subsystem for Linux
    "VirtualMachinePlatform"
    "Microsoft-Windows-Subsystem-Linux"
# Hypervisor
    "HypervisorPlatform"
    "Microsoft-Hyper-V-All"
    "Microsoft-Hyper-V"
    "Microsoft-Hyper-V-Tools-All"
    "Microsoft-Hyper-V-Management-PowerShell"
    "Microsoft-Hyper-V-Hypervisor"
    "Microsoft-Hyper-V-Services"
    "Microsoft-Hyper-V-Management-Clients")

$features_uninstall= @(
    "Internet-Explorer-Optional-amd64"
    "TelnetClient"
)

# Uninstall undesired features if installed
ForEach ($feature_un in $features_uninstall){
    Disable-WindowsOptionalFeature -Online -FeatureName $feature_un -All -NoRestart
}
Write-Host "=================================="
Write-Host "---  Features are Uninstalled  ---"
Write-Host "=================================="

# Install all desired features
ForEach ($feature_in in $features_install){
    Enable-WindowsOptionalFeature -Online -FeatureName $feature_in -All -NoRestart
}

# Edit bootloader for hypervisor
cmd /c bcdedit /set hypervisorschedulertype classic

Write-Host "================================="
Write-Host "---  Features are Installed   ---"
Write-Host "---  Reboot to Apply Changes  ---"
Write-Host "================================="

