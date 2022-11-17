<#
.SYNOPSIS
Get the execution location to be the root of the Teams Toolkit Folder
.DESCRIPTION
.EXAMPLE
.\script-get-toolkitRootfolder.ps1
Get the folder location of the root of the Teams Toolkit
#>
Param(
)

function getRootTeamstoolkitFolder {
    $completePath = $PSScriptRoot

    $executionPath = $completePath.Substring(0, $completePath.LastIndexOf("\"))

    return $executionPath
}

return getRootTeamstoolkitFolder