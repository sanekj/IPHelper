#Requires -Version 5 -Modules @{ ModuleName = 'Pester'; ModuleVersion = '5.0' }

$testsPath = Join-Path -Path $PSScriptRoot -ChildPath '..\Tests'
$resultsDirectory = Join-Path -Path $PSScriptRoot -ChildPath '..\TestResults'
$resultsPath = Join-Path -Path $resultsDirectory -ChildPath 'results.xml'
$codeCoveragePath = Join-Path -Path $resultsDirectory -ChildPath 'coverage.xml'
$moduleFile = Join-Path -Path $PSScriptRoot -ChildPath '..\IPHelper\IPHelper.psm1'

Invoke-Pester -Path $testsPath `
              -OutputFile $resultsPath `
              -OutputFormat NUnitXml `
              -CodeCoverage $moduleFile `
              -CodeCoverageOutputFileFormat JaCoCo `
              -CodeCoverageOutputFile $codeCoveragePath `
              -Show All

$testReportGenerator = Join-Path -Path $PSScriptRoot -ChildPath extent.exe
& $testReportGenerator -i $resultsPath -o $resultsDirectory

<#
$coverageReportGenerator = Join-Path -Path $PSScriptRoot -ChildPath 'coverage\ReportGenerator.exe'
& $coverageReportGenerator "-reports:$codeCoveragePath" "-targetdir:$resultsDirectory" -reporttypes:'HtmlSummary;MHtml' -title:'IPHelper Coverage Tests'
#>