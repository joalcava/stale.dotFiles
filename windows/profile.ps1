Import-Module posh-git
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true


# Functions for alias
function git-status { git status }
function git-pull { git pull }
function git-push { git push }
function git-log { git log }
function git-add { git add . }
function git-add-all { git add --all }
function dotnet-run { dotnet run }
function dotnet-watch-run { dotnet watch run }

Set-Alias -Name gits -Value git-status
Set-Alias -Name gitpl-Value git-pull
Set-Alias -Name gitp-Value git-push
Set-Alias -Name gitl -Value git-log
Set-Alias -Name gita -Value git-add
Set-Alias -Name gita.a -Value git-add-all
Set-Alias -Name dnetr -Value dotnet-run
Set-Alias -Name dnetr.w -Value dotnet-watch-run
