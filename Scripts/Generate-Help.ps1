#Requires -Module platyPS

# Install-Module -Name platyPS -Scope AllUsers -Force

$modulePath = Join-Path -Path $PSScriptRoot -ChildPath '..\IPHelper'
Import-Module -Name $modulePath -ErrorAction Stop

$docPath = Join-Path -Path $PSScriptRoot -ChildPath '..\Documentation'
New-MarkdownHelp -Module IPHelper -OutputFolder $docPath -WithModulePage -Force

$xmlDocPath = Join-Path -Path $modulePath -ChildPath en-US
New-ExternalHelp -Path $docPath -OutputPath $xmlDocPath -Force
