$XDMachines = Get-ADComputer -LDAPFilter "(name=*)"-SearchBase "OU=TargetOU,OU=OtherTargetOU,DC=DomainName,DC=TLD
foreach ($XDMachine in $XDMachines)
{
    if(Test-Connection -ComputerName $XDMachine.Name -Quiet -Count 1)
    {
        Invoke-Command -ComputerName $XDMachine.Name -ScriptBlock {
        ipconfig /renew
		}
    }
}
