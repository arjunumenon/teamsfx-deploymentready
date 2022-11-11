<#
.SYNOPSIS
Deploy build files to the Azure storage for Teams Tab
.DESCRIPTION
.EXAMPLE
.\scripts-deploy-tabs.ps1 -environmentName "dev"
Provision all build files to Azure for Teams Tab
#>
Param(
    [Parameter(Mandatory = $true)]
    [string]$environmentName = "dev"
)

function doDeploymentTabs {
    teamsfx deploy frontend-hosting --env $environmentName --interactive false
}

doDeploymentTabs