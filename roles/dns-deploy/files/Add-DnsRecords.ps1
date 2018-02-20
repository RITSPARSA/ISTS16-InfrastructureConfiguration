# PTR records assume that the network is a /24

param (
    [Parameter(Mandatory=$true)][string]$FileName,
    [Parameter(Mandatory=$true)][int32]$TeamNumber,
    [Parameter(Mandatory=$true)][string]$server,
    [switch]$CreatePtrs = $true
)

$revzones = @()

Import-Csv $FileName | % {
    $ip = $_.Address.replace("X", $TeamNumber)
    $RevZoneName = $ip.split(".")[2] + "." + $ip.split(".")[1] + "." + $ip.split(".")[0] + ".in-addr.arpa"

    # If the user wants a reverse zone, create it on the first loop only
    if ($CreatePtrs -eq $true -and $revzones -contains $RevZoneName -eq $false) {
        $NetworkId = $ip.split(".")[0] + "." + $ip.split(".")[1] + "." + $ip.split(".")[2] + ".0/24"
        Add-DnsServerPrimaryZone -NetworkId "$NetworkId" -ReplicationScope Domain
        $revzones += $RevZoneName
    }
    
    
    $fqdn = $_.Name.replace("teamX","team$TeamNumber")
    $name = $fqdn.split(".")[0]
    $domain_split = $fqdn.split(".")
    $domain = ($domain_split[1..($domain_split.length -1)] -join ".")
    
    $alias = $_.Address
    $priority = "10"
    $srvr = $server -split "\." 
    $addr = $ip -split "\."
    $rec = [WmiClass]"\\$($srvr[0])\root\MicrosoftDNS:MicrosoftDNS_ResourceRecord" 
    

    if ($_.Type -eq "A"){
        #Add-DnsServerResourceRecordA -Name $name -IPv4Address $ip -ZoneName $domain -CreatePtr:$CreatePtrs
        $text = "$fqdn IN A $ip"  
        $rec.CreateInstanceFromTextRepresentation($server, $domain, $text)  
    }
    if ($_.Type -eq "MX"){
        #Add-DnsServerResourceRecordMX -Name . -Preference 10 -MailExchange $fqdn -ZoneName $domain
        $text = "$domain IN MX $priority $fqdn"  
        $rec.CreateInstanceFromTextRepresentation($server, $domain, $text) 
    }
    if ($_.Type -eq "CNAME"){
        #Add-DnsServerResourceRecordCName -Name $name -HostNameAlias $_.Address -ZoneName $domain
        $text = "$alias IN CNAME $fqdn"  
        $rec.CreateInstanceFromTextRepresentation($server, $domain, $text)
    }
    if ($CreatePtrs -eq $true) {
        #Add-DnsServerResourceRecordPtr -name $_.Address.split(".")[3] -ZoneName $RevZoneName -PtrDomainName $fqdn -ErrorAction SilentlyContinue
        $text = "$($addr[3]).$RevZoneName IN PTR $fqdn"  
        $rec.CreateInstanceFromTextRepresentation($server, $RevZoneName, $text)
    }
}

# Enable Zone Transfers
foreach ($zone in Get-DnsServerZone | select -ExpandProperty $_.ZoneName | where {$_.ZoneType -eq 'Primary' -and $_.IsAutoCreated -ne 'False'}) { cmd.exe /c dnscmd /ZoneResetSecondaries $zone.ZoneName /NonSecure}

# Enable Zone Updates
foreach ($zone in Get-DnsServerZone | select -ExpandProperty $_.ZoneName | where {$_.ZoneType -eq 'Primary' -and $_.IsAutoCreated -ne 'False' -and $_ZoneName -ne 'TrustAnchors'}) { cmd.exe /c dnscmd /Config $zone.ZoneName /AllowUpdate 1}
