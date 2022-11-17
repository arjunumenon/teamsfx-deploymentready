<#
.SYNOPSIS
    Deploy the bot related files to the Azure Bot App Service
.DESCRIPTION
    This script will deploy the build files to Azure App Services for Bot

    CREATED BY : Arjun Menon
    CREATED ON : 2022-11-17

.PARAMETER environmentName
    The name of the Teams Toolkit environment to deploy the Bot files to

.INPUTS
    None. You cannot pipe objects to script-delete-all-buildfiles.ps1.
.OUTPUTS
    None. Shows the success messages for the execution

.EXAMPLE
    PS C:\> .\script-deploy-bots.ps1 -environmentName "dev"
    Provision all the build files to Azure Bot App Service

.NOTES
    None
#>
Param(
    [Parameter(Mandatory = $true)]
    [string]$environmentName = "dev"
)

function doDeploymentBot {
    Write-Host "Initiated the Deployment of BOT files" -foreground Yellow
    # Setting the location to be root of the Teams Toolkit Folder and deleting files
    $rootTeamsToolkitFolder = .\script-get-toolkitRootfolder.ps1
    Set-Location -Path $rootTeamsToolkitFolder

    teamsfx deploy bot  --env $environmentName --interactive false

    # Resetting the execution location to be script root
    Set-Location -Path $PSScriptRoot
    Write-Host "Deployed the build files to Aure Function" -foreground Green
}

doDeploymentBot