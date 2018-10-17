
#alias for ls
Set-Alias -Name ls -Value PowerLS -Option AllScope
function prompt {
   "r00t_@ [" + (Resolve-Path .\).Path + "]>"
}

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


