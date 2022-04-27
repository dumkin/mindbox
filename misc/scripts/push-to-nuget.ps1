function PushToNuget {

    param (
        [string] $SolutionPath,
        [string[]] $Projects,
        [nullable[bool]] $ReleaseConfiguration,
        [nullable[bool]] $IsFramework
    )

    # Указать true, чтобы только посмотреть какие проекты будут пушиться в nuget
    $PrintOnly = $false
    if ($PrintOnly) {
        Write-Host Solution - $SolutionPath
    }

    $configuration = "Debug" # Значение по умолчанию
    if ($null -ne $ReleaseConfiguration) {
        if ($ReleaseConfiguration -eq $true) {
            $configuration = "Release"
        }
        else {
            $configuration = "Debug"
        }
    }

    if ($null -eq $IsFramework) {
        $IsFramework = $false
    }

    foreach ($project in $Projects) {
        if ($PrintOnly) {
            Write-Host Project - $project in $configuration
        }
        else {
            if (!$IsFramework) {
                $projectPath = Join-Path -Path "$SolutionPath" -ChildPath "$project"
                $binPath = Join-Path -Path (Join-Path -Path "$projectPath" -ChildPath "bin") -ChildPath "$configuration"
                $packagePath = Join-Path -Path "$binPath" -ChildPath "$project.*.nupkg"

                & dotnet clean "$projectPath" -c $configuration -v m --nologo
                Remove-Item -Recurse -Force "$binPath" -ErrorAction Ignore
                & dotnet build "$projectPath" -c $configuration -v m --nologo
                & dotnet nuget push "$packagePath" --source local-nuget
            }
            else {
                & nuget restore "$SolutionRoot\$project\$project.csproj" -ForceEnglishOutput -Verbosity normal
                & nuget pack "$SolutionRoot\$project\$project.csproj" -Build -OutputDirectory "$SolutionRoot\nuget-packages" -Properties Configuration=$configuration -ForceEnglishOutput -Verbosity normal
            }
            
        }
    }
    if (!$PrintOnly) {
        if ($IsFramework) {
            & nuget push "$SolutionRoot\nuget-packages\*.nupkg" -Source local-nuget -ForceEnglishOutput -Verbosity normal
            Remove-Item -LiteralPath "$SolutionRoot\nuget-packages" -Force -Recurse
        }
    }
    
    Write-Host
}