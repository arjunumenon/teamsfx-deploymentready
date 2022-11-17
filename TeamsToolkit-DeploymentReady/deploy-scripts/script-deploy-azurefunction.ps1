<#
.SYNOPSIS
    Deploy build files to Azure Functions
.DESCRIPTION
    This script will deploy the build files to Azure Functions

    CREATED BY : Arjun Menon
    CREATED ON : 2022-11-17

.PARAMETER environmentName
    The name of the Teams Toolkit environment to deploy the Azure Function to

.INPUTS
    None. You cannot pipe objects to script-delete-all-buildfiles.ps1.
.OUTPUTS
    None. Shows the success messages for the execution

.EXAMPLE
    PS C:\> .\script-deploy-azurefunction.ps1 -environmentName "dev"
    Provision all the Azure function build files to Azure

.NOTES
    None
#>
Param(
    [Parameter(Mandatory = $true)]
    [string]$environmentName = "dev"
)

function doDeploymentAzurefunction {
    # Setting the location to be root of the Teams Toolkit Folder and deleting files
    $rootTeamsToolkitFolder = .\script-get-toolkitRootfolder.ps1
    Set-Location -Path $rootTeamsToolkitFolder

    teamsfx deploy function  --env $environmentName --interactive false

    # Resetting the execution location to be script root
    Set-Location -Path $PSScriptRoot
    Write-Host "Deployed the build files to Aure Function" -foreground Green
}

doDeploymentAzurefunction