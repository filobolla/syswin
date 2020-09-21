:: thunderbird_backProfile
:: This scripts mirrors the entire thunderbird profile folder in order to back up it and make it easy to restore
@echo off
echo.
robocopy "C:\Users\%USERNAME%\Desktop\backup_onenote" "Y:\Thunderbird_backup/Thunderbird_%USERNAME%\Thunderbird" /Z /MIR /NP /unilog:"Y:\Thunderbird_backup\Thunderbird_%USERNAME%\thunderbird_%USERNAME%_log.log" > nul
