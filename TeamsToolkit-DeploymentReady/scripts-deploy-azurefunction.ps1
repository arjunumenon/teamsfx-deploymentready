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
    teamsfx deploy function  --env $environmentName --interactive false
}

doDeploymentAzurefunction