<#
.SYNOPSIS
    Script which is used to provision all the resources (Azure Function, Tabs, Bots) to Azure
.DESCRIPTION
    This script will provision all the resources (Azure Function, Tabs, Bots) to Azure

    CREATED BY : Arjun Menon
    CREATED ON : 2022-11-17

.PARAMETER environmentName
    The name of the Teams Toolkit environment to provision the files to

.PARAMETER resourcegroupName
    The name of the resource group to provision the resources to

.INPUTS
    None. You cannot pipe objects to script-package-teamsapp.ps1.
.OUTPUTS
    None. Shows the success messages for the execution

.EXAMPLE
    PS C:\> .\script-provision-complete.ps1 -environmentName "dev" -resourcegroupName "Teams-Dev-TCS"
    Provision all the resources (Azure Function, Tabs, Bots) to the mentioned resource group and environment

.NOTES
    None
#>
Param(
    [Parameter(Mandatory = $true)]
    [string]$environmentName,
    [Parameter(Mandatory = $true)]
    [string]$resourcegroupName
)

function doProvisioning {

    # Method to provision Artefacts to Azure

    Write-Host "Initiating the provisioning of artefacts to Azure Resource Group" -foreground Yellow
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