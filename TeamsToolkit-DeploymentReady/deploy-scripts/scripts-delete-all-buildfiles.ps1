<#
.SYNOPSIS
Execute the clearing of all build files for preparing for porting to production deployment
.DESCRIPTION
.EXAMPLE
.\scripts-delete-all-buildfiles.ps1 
Clears all the build files
#>
Param(
)

function doDeleteAzureFunctionfiles {
    # # Deletion for Azure Functions
    # cd api
    # Remove-Item -Recurse -Force .\.deployment\
    # Remove-Item -Recurse -Force .\bin\
    # Remove-Item -Recurse -Force .\dist\
    # Remove-Item -Recurse -Force .\node_modules\
    # Remove-Item -Recurse -Force .\obj\
    # cd ..

    Write-Host "Removed Azure Function Build Files.." -foreground Green
}

function doDeletionStateFiles {
    # Deletion of all state files for fresh provisioning

    # Setting the location to be root of the Teams Toolkit Folder and deleting files
    $rootTeamsToolkitFolder = getRootlocationPath
    Set-Location -Path $rootTeamsToolkitFolder"\.fx\states"
    Remove-Item -Recurse -Force .\*

    # Resetting the execution location to be script root
    Set-Location -Path $PSScriptRoot
    Write-Host "Removed .fx state files Files.." -foreground Green
}

function doDeletionBotfiles {
    # Deletion for Bot
    # Setting the location to be root of the Teams Toolkit Folder and deleting files
    $rootTeamsToolkitFolder = getRootlocationPath
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
    $rootTeamsToolkitFolder = getRootlocationPath
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
    $rootTeamsToolkitFolder = getRootlocationPath
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

# Get the location path of the Root folder
function getRootlocationPath {
    $completePath = $PSScriptRoot

    $executionPath = $completePath.Substring(0, $completePath.LastIndexOf("\"))

    return $executionPath
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

