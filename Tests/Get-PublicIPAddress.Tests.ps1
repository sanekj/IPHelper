BeforeAll {
    Remove-Module -Name IPHelper -ErrorAction SilentlyContinue -Force
    $modulePath = Join-Path -Path $PSScriptRoot -ChildPath '..\IPHelper'
    Import-Module -Name $modulePath -Force
}

Describe 'Get-PublicIPAddress' {
    It 'should return an IP address' {
        Get-PublicIPAddress | Should -BeOfType System.Net.IPAddress
    }

    It 'should return a string' {
        Get-PublicIPAddress -AsString | Should -BeOfType System.String
    }

    It 'should return only one IP address' {
        Get-PublicIPAddress | Should -HaveCount 1
    }

    It 'should return an IPv4 address' {
        Get-PublicIPAddress |
            Select-Object -ExpandProperty AddressFamily |
            Should -Be ([System.Net.Sockets.AddressFamily]::InterNetwork)
    }

    It 'should throw an error when there is no internet connectivity' {
        Mock Invoke-RestMethod { throw [System.Net.WebException]::new('Internet error') }

        { Get-PublicIPAddress -ErrorAction Stop } | Should -Throw
        { Get-PublicIPAddress -ErrorAction SilentlyContinue } | Should -Not -Throw
    }

    It 'should throw an error when the the data returned is invalid' {
        Mock Invoke-RestMethod { return 'jfskhfjksaghfjksagfjshafg' }

        { Get-PublicIPAddress -ErrorAction Stop } | Should -Throw 'Failed parsing the returned IP address.'
        { Get-PublicIPAddress -ErrorAction SilentlyContinue } | Should -Not -Throw
    }

    It 'should throw an error when the the data returned is empty' {
        Mock Invoke-RestMethod { return '' }

        { Get-PublicIPAddress -ErrorAction Stop } | Should -Throw 'Failed parsing the returned IP address.'
        { Get-PublicIPAddress -ErrorAction SilentlyContinue } | Should -Not -Throw
    }

    It 'should throw an error when the the data returned is null' {
        Mock Invoke-RestMethod { return $null }

        { Get-PublicIPAddress -ErrorAction Stop } | Should -Throw 'Failed parsing the returned IP address.'
        { Get-PublicIPAddress -ErrorAction SilentlyContinue } | Should -Not -Throw
    }
}