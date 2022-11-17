<#
.SYNOPSIS
    Execute the deployment of all resources (Azure Function, Tabs, Bots) to Azure. Script also packages the Team App to be uploaded to the Teams App Catalog.
.DESCRIPTION
    This script will execute the deployment of all resources (Azure Function, Tabs, Bots) to Azure

    CREATED BY : Arjun Menon
    CREATED ON : 2022-11-17

.PARAMETER environmentName
    The name of the Teams Toolkit environment to deploy the files to

.INPUTS
    None. You cannot pipe objects to script-delete-all-buildfiles.ps1.
.OUTPUTS
    None. Shows the success messages for the execution

.EXAMPLE
    PS C:\> .\script-deploy-complete.ps1 -environmentName "dev"
    Initiate the deployment of all resources (Azure Function, Tabs, Bots) to Azure

.NOTES
    None
#>
Param(
    [Parameter(Mandatory = $true)]
    [string]$environmentName = "dev"
)

function doDeploymentComplete {
    Write-Host "... Initiating the deployment of all the files to Azure.... " -foreground Yellow

    # Deploy Bot files
    .\script-deploy-bots.ps1 -environmentName $environmentName

    # Deploy Azure Function files
    .\script-deploy-azurefunction.ps1 -environmentName $environmentName

    # Deploy Tab Files
    .\script-deploy-tabs.ps1 -environmentName $environmentName

    # Package Teams app for the Environment
    .\script-package-teamsapp.ps1 -environmentName $environmentName

    Write-Host "Completed all the deployment to Azure" -foreground Green
}

doDeploymentComplete