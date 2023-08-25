IEX (IWR 'https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing);Install-AtomicRedTeam -InstallPath "~/.local/powershell/Modules"
New-Item -ItemType File -Path ~/.config/powershell/Microsoft.PowerShell_profile.ps1 -Force
echo "Import-Module ~/.local/powershell/Modules/invoke-atomicredteam/" > ~/.config/powershell/Microsoft.PowerShell_profile.ps1
Get-Help Invoke-AtomicTest