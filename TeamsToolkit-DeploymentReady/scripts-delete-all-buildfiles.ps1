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
}

function doDeletionStateFiles {
    # Deletion of all state files for fresh provisioning
    cd .\.fx\states
    Remove-Item -Recurse -Force .\*
    cd ..
    cd ..
}

function doDeletionBotfiles {
    # Deletion for Bot
    cd bot
    $deletionFolders = @(
        ".\.deployment\",
        ".\lib\",
        ".\node_modules\"
    );
    foreach($folder in $deletionFolders) {
        if(test-path $folder) {
            Remove-Item -Recurse -Force $folder
        }
    }
    cd ..
}

function doDeletionTabfiles {
    # Deletion for Bot
    cd tabs
    $deletionFolders = @(
        ".\.deployment\",
        ".\build\",
        ".\node_modules\"
    );
    foreach($folder in $deletionFolders) {
        if(test-path $folder) {
            Remove-Item -Recurse -Force $folder
        }
    }
    cd ..
}

function doDeletionApppackagefiles {
    # Deletion for Bot
    cd tabs
    $deletionFolders = @(
        ".\build\"
    );
    foreach($folder in $deletionFolders) {
        if(test-path $folder) {
            Remove-Item -Recurse -Force $folder
        }
    }
    cd ..
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
    doDeletionApppackagefiles

}

doDeletionforPortingFolder