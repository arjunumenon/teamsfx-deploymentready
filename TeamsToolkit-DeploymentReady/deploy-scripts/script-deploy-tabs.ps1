<#
.SYNOPSIS
    Deploy build files to the Azure storage for Teams Tab
.DESCRIPTION
    This script will deploy build files to the Azure storage for Teams Tab

    CREATED BY : Arjun Menon
    CREATED ON : 2022-11-17

.PARAMETER environmentName
    The name of the Teams Toolkit environment to deploy the Tab files to

.INPUTS
    None. You cannot pipe objects to script-deploy-tabs.ps1.
.OUTPUTS
    None. Shows the success messages for the execution

.EXAMPLE
    PS C:\> .\script-deploy-tabs.ps1 -environmentName "dev"
    The command will deploy build files to the Azure storage for Teams Tab

.NOTES
    None
#>
Param(
    [Parameter(Mandatory = $true)]
    [string]$environmentName = "dev"
)

function doDeploymentTabs {
    Write-Host "Initiated the Deployment of TAB files" -foreground Yellow
    # Setting the location to be root of the Teams Toolkit Folder and deleting files
    $rootTeamsToolkitFolder = .\script-get-toolkitRootfolder.ps1
    Set-Location -Path $rootTeamsToolkitFolder

    teamsfx deploy frontend-hosting --env $environmentName --interactive false

    # Resetting the execution location to be script root
    Set-Location -Path $PSScriptRoot
    Write-Host "Deployed the build files to TAB" -foreground Green
}

doDeploymentTabs