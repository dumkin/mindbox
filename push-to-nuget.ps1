[string[]]$projects = @()
$projects += "Mindbox.FigureAreaUtils"

$SolutionRoot = [System.IO.Path]::GetFullPath("$PSScriptRoot")
. "$SolutionRoot\misc\scripts\push-to-nuget.ps1"
PushToNuget -SolutionPath $SolutionRoot -Projects $projects -ReleaseConfiguration $releaseConfiguration