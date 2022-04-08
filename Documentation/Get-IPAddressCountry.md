---
external help file: IPHelper-help.xml
Module Name: IPHelper
online version:
schema: 2.0.0
---

# Get-IPAddressCountry

## SYNOPSIS
Gets the country where the provided IP address is located in.

## SYNTAX

```
Get-IPAddressCountry [-IPAddress] <String[]> [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
.\Get-IPAddressCountry.ps1 -IPAddress 8.8.8.8
```

Gets the country where 8.8.8.8 is located.

### EXAMPLE 2
```
.\Get-IPAddressCountry.ps1 8.8.8.8
```

### EXAMPLE 3
```
'212.24.152.82','8.8.8.8' | Get-IPAddressCountry
```

## PARAMETERS

### -IPAddress
One or more IP addresses to get the country of.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: IP

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[.\Get-PublicIPAddress.ps1]()

