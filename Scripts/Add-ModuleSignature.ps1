<#
.SYNOPSIS
Script for signing module

#>

#Requires -Version 3

[string] $ipHelperPath = Join-Path $PSScriptRoot -ChildPath "..\IPHelper"
[X509Certificate] $codeCertificate =
    Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert |
    Sort-Object -Property NotBefore -Descending | 
    Select-Object -First 1 

Get-ChildItem -Path $ipHelperPath -Recurse -File -Include '*.psm1','*.psd1' | 
    Get-AuthenticodeSignature |
    Where-Object Status -ne ([System.Management.Automation.SignatureStatus]::Valid) |
    Select-Object -ExpandProperty Path |
    Set-AuthenticodeSignature -Certificate $codeCertificate `
                              -HashAlgorithm SHA256 `
                              -Timestamp 'http://timestamp.digicert.com' `
                              -Force