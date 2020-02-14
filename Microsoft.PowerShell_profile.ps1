
#alias for ls
Set-Alias -Name ls -Value PowerLS -Option AllScope


#function prompt {
#   "r00t_@ [" + (Resolve-Path .\).Path + "]>"
#}


#explorer for current path
Function e {
   Invoke-Item .
}

function Quote-List {
   $args
}

Set-Alias qs Quote-String
Set-Alias ql Quote-List

function cleanasptemp() {
   Remove-Item -Path "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\*.*" -Force
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
   Import-Module "$ChocolateyProfile"
}

function cleanbin() {
   Get-ChildItem .\ -include bin, obj -Recurse | ForEach-Object ($_) { remove-item $_.fullname -Force -Recurse }
}


function pgrep { param([string]$search, [string]$inc) Get-ChildItem -recurse -include $inc | Select-String -CaseSensitive $search }




function prompt
{
    # # Determine if Powershell is running as Administrator
    # $currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )
    # $isAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

    # $leftCharCount = 0
    # $middleCharCount = 0
    # $rightCharCount = 0

    # # Grab current git branch
    # $isGitRepo = ""
    # if(Test-Path .git) {
    #     $isGitRepo = "yeah"
    # }

    # # Grab current loaction
    # $location = $(get-location).Path;

    # Write-Host ("")
    # Write-Host (" [ ") -nonewline -foregroundcolor White -backgroundcolor DarkBlue
    # $leftCharCount += 3
    # Write-Host ([Environment]::UserName) -nonewline -foregroundcolor White -backgroundcolor DarkBlue
    # $leftCharCount += [Environment]::UserName.length
    # if ($isAdmin) {
    #     Write-Host ("†") -nonewline -foregroundcolor DarkYellow -backgroundcolor DarkBlue
    #     $leftCharCount += 1
    # }
    # Write-Host ("@") -nonewline -foregroundcolor Gray -backgroundcolor DarkBlue
    # $leftCharCount += 2
    # Write-Host ([System.Net.Dns]::GetHostName()) -nonewline -foregroundcolor White -backgroundcolor DarkBlue
    # $leftCharCount += [System.Net.Dns]::GetHostName().length
    # Write-Host (" ] ") -nonewline -foregroundcolor White -backgroundcolor DarkBlue
    # $leftCharCount += 3
    # Write-Host ("▓▓▒▒░░") -nonewline
    # $leftCharCount += 6

    # if ($isGitRepo) {
    #     # Grab current branch
    #     $git_branchName = "";
    #     git branch | foreach {
    #         if ($_ -match "^\* (.*)") {
    #             $git_branchName += $matches[1]
    #         }
    #     }

    #     # Check if workspace has changes
    #     $git_changes = 0
    #     $git_changesDisplay = ""
    #     git status --porcelain | foreach {
    #         $git_changes++
    #     }
    #     if ($git_changes -gt 0) {
    #         $git_changesDisplay = "•"
    #     }

    #     # Check if pushes or pulls available
    #     $git_pushes = ""
    #     $git_pulls = ""
    #     git status -sb | foreach {
    #         if ($_ -match "ahead (\d+)") {
    #             $git_pushes = " ↑" + $matches[1]
    #         }
    #         if ($_ -match "behind (\d+)") {
    #             $git_pulls = " ↓" + $matches[1]
    #         }
    #     }

    #     # Calculate length of git display (by making a new string)
    #     $rightCharCount = "[ Ѱ$($git_changesDisplay) $($git_branchName)$($git_pushes)$($git_pulls) ] ".length

    #     # Write spaces for padding, so that the display is right-aligned
    #     $middleCharCount = $ui.WindowSize.Width - $leftCharCount - $rightCharCount
    #     for ($i=1; $i -le $middleCharCount; $i++)
    #     {
    #         Write-Host (" ") -nonewline
    #     }

    #     # Actually output the git display
    #     Write-Host ("[ ") -nonewline
    #     Write-Host ("Ѱ") -nonewline -foregroundcolor DarkGray
    #     Write-Host ($git_changesDisplay) -nonewline -foregroundcolor DarkGreen
    #     Write-Host (" $git_branchName") -nonewline
    #     Write-Host ("$git_pushes") -nonewline -foregroundColor Green
    #     Write-Host ("$git_pulls") -nonewline -foregroundColor Red
    #     Write-Host (" ] ") -nonewline
    # } else {
    #     # No alternate display, just send a newline
    #     Write-Host ("")
    # }

    Write-Host ("r00t_»") -nonewline -foregroundcolor DarkGreen

    return " "
}