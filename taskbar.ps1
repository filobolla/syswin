# Taskbar.ps1
# Add programs to taskbar via PinUtil: https://github.com/ChrisRfr/PinUtil

$pin_to_taskbar=@(
    "%windir\System32\WindowsPowerShell\v1.0\powershell.exe"
    "Microsoft.Windows.Photos_8wekyb3d8bbwe!App"
)

foreach($pin in $pin_to_taskbar){
    Write-Host "pinning"$pin"..."
    Invoke-Expression -Command 'C:\Users\Filippo\Downloads\PinUtil.exe TaskBar' $pin
}