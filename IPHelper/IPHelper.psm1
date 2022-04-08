<#
.SYNOPSIS
Returns the public IP address of this computer.

.DESCRIPTION

.PARAMETER AsString
If present, returns the IP address as a string.

.EXAMPLE
Get-PublicIpAddress

Returns the public IP address of this computer in the form of an IPAddress object.

.EXAMPLE
Get-PublicIpAddress -AsString

Returns the public IP address of this computer in the form of a string.

#>
function Get-PublicIpAddress{
    [OutputType([ipaddress],[string])]
    param(
        [switch] $AsString
    )

    [string] $endpoint = 'https://api.ipify.org/'
    [string] $ip = Invoke-RestMethod -Uri $endpoint -UseBasicParsing

    if($AsString.IsPresent)
    {
        return $ip
    }
    else
    {
        return [ipaddress] $ip
    }
}

<#
.SYNOPSIS
Gets the country where the provided IP address is located in.

.PARAMETER IPAddress
One or more IP addresses to get the country of.

.EXAMPLE
.\Get-IPAddressCountry.ps1 -IPAddress 8.8.8.8

Gets the country where 8.8.8.8 is located.

.EXAMPLE
.\Get-IPAddressCountry.ps1 8.8.8.8

.EXAMPLE
'212.24.152.82','8.8.8.8' | Get-IPAddressCountry

.LINK
.\Get-PublicIPAddress.ps1

#>
function Get-IPAddressCountry
{
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidatePattern('^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$')]
        # [ValidateScript({ $PSItem | Foreach-Object { [ipaddress]::TryParse($PSItem, [ref] $null) } })]
        [Alias('IP')]
        [string[]]
        $IPAddress
    )

    process
    {
        foreach ($ip in $IPAddress) {
            [string] $uri = 'https://ip2c.org/?ip={0}' -f $ip
            [string] $response = Invoke-RestMethod -Uri $uri -UseBasicParsing -ErrorAction Stop
            [string] $country = $response.Split(';')[3]

            Write-Output -InputObject ([PSCustomObject]@{
                IPAddress = $ip
                Country = $country
            })
        }
    }
}

New-Alias -Name WhatIsMyIP -Value Get-PublicIPAddress
New-Alias -Name MyIP -Value Get-PublicIPAddress

Export-ModuleMember -Function * -Alias *