<#
.SYNOPSIS
    Execute the clearing of all build files for preparing for porting to production deployment
.DESCRIPTION
    Delete all the build files from the Teams Toolkit project. This script is to prepare for porting to production deployment.
.EXAMPLE
    PS C:\> .\script-delete-all-buildfiles.ps1 
    Clears all the build files
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    This script is to prepare for porting to production deployment.
#>
Param(
)

function doDeletionStateFiles {
    # Deletion of all state files for fresh provisioning

    # Setting the location to be root of the Teams Toolkit Folder and deleting files
    $rootTeamsToolkitFolder = .\script-get-toolkitRootfolder.ps1
    Set-Location -Path $rootTeamsToolkitFolder"\.fx\states"
    Remove-Item -Recurse -Force .\*

    # Resetting the execution location to be script root
    Set-Location -Path $PSScriptRoot
    Write-Host "Removed .fx state files Files.." -foreground Green
}

function doDeleteAzureFunctionfiles {
    # # Deletion for Azure Functions

    # Setting the location to be root of the Teams Toolkit Folder and deleting files
    $rootTeamsToolkitFolder = .\script-get-toolkitRootfolder.ps1
    Set-Location -Path $rootTeamsToolkitFolder"\api"
    $deletionFolders = @(
        ".\.deployment\",
        ".\bin\",
        ".\dist\",
        ".\lib\",
        ".\node_modules\",
        ".\obj\"
    );
    foreach ($folder in $deletionFolders) {
        if (test-path $folder) {
            Remove-Item -Recurse -Force $folder
        }
    }
    # Resetting the execution location to be script root
    Set-Location -Path $PSScriptRoot
    Write-Host "Removed Azure Function Build Files.." -foreground Green
}

function doDeletionBotfiles {
    # Deletion for Bot
    # Setting the location to be root of the Teams Toolkit Folder and deleting files
    $rootTeamsToolkitFolder = .\script-get-toolkitRootfolder.ps1
    Set-Location -Path $rootTeamsToolkitFolder"\bot"
    $deletionFolders = @(
        ".\.deployment\",
        ".\lib\",
        ".\node_modules\"
    );
    foreach ($folder in $deletionFolders) {
        if (test-path $folder) {
            Remove-Item -Recurse -Force $folder
        }
    }
    # Resetting the execution location to be script root
    Set-Location -Path $PSScriptRoot
    Write-Host "Removed Bot Build Files.." -foreground Green
}

function doDeletionTabfiles {
    # Deletion for Tab
    # Setting the location to be root of the Teams Toolkit Folder and deleting files
    $rootTeamsToolkitFolder = .\script-get-toolkitRootfolder.ps1
    Set-Location -Path $rootTeamsToolkitFolder"\tabs"
    $deletionFolders = @(
        ".\.deployment\",
        ".\build\",
        ".\node_modules\"
    );
    foreach ($folder in $deletionFolders) {
        if (test-path $folder) {
            Remove-Item -Recurse -Force $folder
        }
    }
    # Resetting the execution location to be script root
    Set-Location $PSScriptRoot
    Write-Host "Removed Tab Build Files.." -foreground Green
}

function doDeletionAppackagefiles {
    # Deletion of Teams App Package Files
    # Setting the location to be root of the Teams Toolkit Folder and deleting files
    $rootTeamsToolkitFolder = .\script-get-toolkitRootfolder.ps1
    Set-Location -Path $rootTeamsToolkitFolder
    $deletionFolders = @(
        ".\build\"
    );
    foreach ($folder in $deletionFolders) {
        if (test-path $folder) {
            Remove-Item -Recurse -Force $folder
        }
    }

    # Resetting the execution location to be script root
    Set-Location $PSScriptRoot
    Write-Host "Removed Teams App Packages" -foreground Green
}

function doDeletionforPortingFolder {

    # Delete State files
    doDeletionStateFiles

    # Delete Azure Function Files
    doDeleteAzureFunctionfiles

    # Delete Bot Files
    doDeletionBotfiles

    # Delete Tab Files
    doDeletionTabfiles

    # Delete App Package Files
    doDeletionAppackagefiles

}

doDeletionforPortingFolder

