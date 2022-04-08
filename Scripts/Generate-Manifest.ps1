New-ModuleManifest -Path $PSScriptRoot\..\IPHelper\IPHelper.psd1 `
                   -RootModule IPHelper.psm1 `
                   -ModuleVersion 1.0 `
                   -PowerShellVersion 3.0 `
                   -Guid 'bcfa9e3a-3bd8-46dc-909e-10ec9be3845d' `
                   -Author 'Michael Grafnetter' `
                   -Description 'IP Address Helper' `
                   -CompanyName Gopas `
                   -Copyright '(c) 2022 Michael Grafnetter. All rights reserved.' `
                   -FunctionsToExport 'Get-IPAddressCountry','Get-PublicIPAddress' `
                   -CmdletsToExport @() `
                   -VariablesToExport @() `
                   -AliasesToExport 'WhatIsMyIP','MyIP'
               