<#
.SYNOPSIS
    This script will package the Teams App for the deployment to Teams App Catalog
.DESCRIPTION
    This script will package the Teams App for the deployment to Teams App Catalog

    CREATED BY : Arjun Menon
    CREATED ON : 2022-11-17

.PARAMETER environmentName
    The name of the Teams Toolkit environment for taking the Teams App Configuration from

.INPUTS
    None. You cannot pipe objects to script-package-teamsapp.ps1.
.OUTPUTS
    None. Shows the success messages for the execution

.EXAMPLE
    PS C:\> .\script-package-teamsapp.ps1 -environmentName "dev"
    Package the Teams app for deployment for the environment mentioned

.NOTES
    None
#>
Param(
    [Parameter(Mandatory = $true)]
    [string]$environmentName = "dev"
)

function doPackageTeamsApp {
    Write-Host "Initiated the packaging of Teams App" -foreground Yellow
    # Setting the location to be root of the Teams Toolkit Folder and deleting files
    $rootTeamsToolkitFolder = .\script-get-toolkitRootfolder.ps1
    Set-Location -Path $rootTeamsToolkitFolder

    teamsfx package --env $environmentName --interactive false

    # Resetting the execution location to be script root
    Set-Location -Path $PSScriptRoot
    Write-Host "Packaging of Teams App Completed" -foreground Green
}

doPackageTeamsApp