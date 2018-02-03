$Users = Import-Csv -Path "C:\useraccounts.csv"

#$domainname = (Get-ADDomain | select -expand dnsroot)

foreach ($User in $Users)
{
    $Displayname = $User.name
    $SAM = $User.bref_id
    $Password = $User.password
    #New-ADUser -Name "$Displayname" -DisplayName "$Displayname" -SamAccountName $SAM -Description "$Description" -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -EmailAddress $Email -Enabled $true -ChangePasswordAtLogon $false -PasswordNeverExpires $true
    net user $SAM $Password /ADD /DOMAIN
    net group "Domain Admins" $SAM /ADD /DOMAIN
}
