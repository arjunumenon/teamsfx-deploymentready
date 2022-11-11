<#
.SYNOPSIS
Packages the Teams app for deployment
.DESCRIPTION
.EXAMPLE
.\scripts-package-teamsapp.ps1 -environmentName "dev"
Package the Teams app for deployment
#>
Param(
    [Parameter(Mandatory = $true)]
    [string]$environmentName = "dev"
)

function doPackageTeamsApp {
    teamsfx package --env $environmentName --interactive false
}

doPackageTeamsApp