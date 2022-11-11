<#
.SYNOPSIS
Deploy all the build files to the Azure Services
.DESCRIPTION
.EXAMPLE
.\scripts-deploy-bots.ps1 -environmentName "dev"
Provision all the Teams App Artefacts to Azure
#>
Param(
    [Parameter(Mandatory = $true)]
    [string]$environmentName = "dev"
)

function doDeploymentBot {
    teamsfx deploy bot  --env $environmentName --interactive false
}

doDeploymentBot