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

function doDeploymentComplete {
    # # Deploy Bot files
    # .\scripts-deploy-bots.ps1 -environmentName $environmentName

    # # Deploy Azure Function files
    # .\scripts-deploy-azurefunction.ps1 -environmentName $environmentName

    # # Deploy Tab Files
    # .\scripts-deploy-tabs.ps1 -environmentName $environmentName

    # Package Teams app for the Environment
    .\scripts-package-teamsapp.ps1 -environmentName $environmentName
}

doDeploymentComplete