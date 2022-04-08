---
external help file: IPHelper-help.xml
Module Name: IPHelper
online version:
schema: 2.0.0
---

# Get-PublicIpAddress

## SYNOPSIS
Returns the public IP address of this computer.

## SYNTAX

```
Get-PublicIpAddress [-AsString]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
Get-PublicIpAddress
```

Returns the public IP address of this computer in the form of an IPAddress object.

### EXAMPLE 2
```
Get-PublicIpAddress -AsString
```

Returns the public IP address of this computer in the form of a string.

## PARAMETERS

### -AsString
If present, returns the IP address as a string.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

### System.Net.IPAddress
### System.String
## NOTES

## RELATED LINKS
