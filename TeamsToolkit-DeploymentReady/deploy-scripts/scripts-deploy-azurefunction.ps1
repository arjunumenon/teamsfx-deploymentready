<#
.SYNOPSIS
Deploy build files to Azure Functions
.DESCRIPTION
.EXAMPLE
.\scripts-deploy-azurefunction.ps1 -environmentName "dev"
Provision all the Azure function build files to Azure
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