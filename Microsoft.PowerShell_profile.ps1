Set-PoshPrompt -Theme ~/.mytheme.omp.json
Import-Module oh-my-posh
Import-Module posh-git
Import-Module PowerShellGet
Import-Module PSReadLine
#Set-PoshPrompt -Theme jandedobbeleer
Remove-PSReadlineKeyHandler 'Ctrl+r'

Remove-PSReadlineKeyHandler 'Ctrl+t'

Import-Module PSFzf


# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
