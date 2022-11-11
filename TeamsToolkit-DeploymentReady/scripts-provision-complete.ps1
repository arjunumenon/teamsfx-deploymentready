<#
.SYNOPSIS
Execute the complete Provisioning of the Teams App Artefacts tp Azure
.DESCRIPTION
.EXAMPLE
.\scripts-provision-complete.ps1 -environmentName "dev" -resourcegroupName "Teams-Dev-TCS"
Provision all the Teams App Artefacts to Azure
#>
Param(
    [Parameter(Mandatory = $true)]
    [string]$environmentName = "dev",
    [Parameter(Mandatory = $true)]
    [string]$resourcegroupName = "Teams-Dev-TCS"
)

function doProvisioning {

    # Execute the provision command using TeamsFX CLI
    teamsfx provision --env $environmentName --resource-group $resourcegroupName --interactive false
}

doProvisioning