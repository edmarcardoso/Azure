#This Function will create a new Resource Manager on Windows Azure and two new virtual Machinne with IIS by PowerShell DCS



Function Setup_IIS_Basic

{

<#Declare parameters

$RGName - Resource Group Name
$LocName - Location Available in your Azure Subscription.

$vNetName - Azure Virtual Network Name (vNET)
$vNetPrefix - vNet NDR Address
$vNetSubnets - vNet Subnet Name
$vNetSubnetsPrefixes - vNEt Subnet Address

$stName - Azure Storage Account Name




#>

[cmdletbinding()]

Param (







)




#Validate if you have Administrative Right to run scripts

If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    {
        Write-Host ""
 	Write-Warning "You do not have Administrator rights to run this script! Make sure to launch Windows PowerShell as Administrator!"
        Break
        Write-Host ""
    }

#Validate if The Azure Module is Installed


$IsAzuerModuleInstalled = Get-Module -Name Azure

If ($IsAzuerModuleInstalled -eq $null){

Write-Host ""
Write-Warning "The Azure PowerShell Module is not installed"
Write-Host ""

}
else{

Write-Host " The Azure PowerShell is Installed" -ForegroundColor Yellow

}
