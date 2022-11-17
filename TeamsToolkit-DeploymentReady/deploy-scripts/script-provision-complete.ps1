<#
.SYNOPSIS
Execute the complete Provisioning of the Teams App Artefacts tp Azure
.DESCRIPTION
.EXAMPLE
.\script-provision-complete.ps1 -environmentName "dev" -resourcegroupName "Teams-Dev-TCS"
Provision all the Teams App Artefacts to Azure
#>
Param(
    [Parameter(Mandatory = $true)]
    [string]$environmentName,
    [Parameter(Mandatory = $true)]
    [string]$resourcegroupName
)

function doProvisioning {

    # Method to provision Artefacts to Azure

    # Setting the location to be root of the Teams Toolkit Folder and deleting files
    $rootTeamsToolkitFolder = .\script-get-toolkitRootfolder.ps1
    Set-Location -Path $rootTeamsToolkitFolder

    # Execute the provision command using TeamsFX CLI
    teamsfx provision --env $environmentName --resource-group $resourcegroupName --interactive false

    # Resetting the execution location to be script root
    Set-Location -Path $PSScriptRoot
    Write-Host "Provisioning of all the files to Azure Complete" -foreground Green
}

doProvisioning