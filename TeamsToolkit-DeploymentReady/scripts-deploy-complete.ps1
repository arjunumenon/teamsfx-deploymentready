<#
.SYNOPSIS
Deploy all the build files to the Azure Services
.DESCRIPTION
.EXAMPLE
.\scripts-deploy-complete.ps1 -environmentName "dev"
Provision all the Teams App Artefacts to Azure
#>
Param(
    [Parameter(Mandatory = $true)]
    [string]$environmentName = "dev"
)

function doDeploymentComplete{
    # Deploy Bot files
    .\scripts-deploy-bots.ps1 -environmentName $environmentName
}

doDeploymentComplete