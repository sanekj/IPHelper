BeforeAll {
    Remove-Module -Name IPHelper -ErrorAction SilentlyContinue -Force
    $modulePath = Join-Path -Path $PSScriptRoot -ChildPath '..\IPHelper'
    Import-Module -Name $modulePath -Force
}

Describe 'Get-IPAddressCountry' {
    Context 'Parameters' {
        It 'should be resolving IP addresses to countries' {
            $result = Get-IPAddressCountry -IPAddress 8.8.8.8
            $result | Should -Not -BeNullOrEmpty
            $result.Country | Should -Be 'United States'
            $result.IPAddress | Should -Be 8.8.8.8
        }

        It 'should accept a positional parameter' {
            $result = Get-IPAddressCountry 8.8.8.8
            $result | Should -Not -BeNullOrEmpty
            $result | Should -HaveCount 1
        }

        It 'should accept an IP address by parameter alias' {
            Get-IPAddressCountry -ip 8.8.8.8 | Should -HaveCount 1
        }

        It 'should accept multiple IP addresses' {
            Get-IPAddressCountry -IPAddress 8.8.8.8,1.1.1.1 | Should -HaveCount 2
        }

        It 'should not accept an invalid IP address' {
            { Get-IPAddressCountry -IPAddress klsdjhgkdshgjk -ErrorAction Stop } | Should -Throw
        }
    }

    Context 'Pipeline' {
        It 'should accept a single IP address through pipeline' {
            '8.8.8.8' | Get-IPAddressCountry | Should -Not -BeNullOrEmpty
        }

        It 'should accept multiple IP addresses through pipeline' {
            '8.8.8.8','1.1.1.1' | Get-IPAddressCountry | Should -HaveCount 2
        }
    }
}
