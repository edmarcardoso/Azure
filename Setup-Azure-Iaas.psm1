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

$vmName - Azure VM Name
$VMSize - Azure VM Size


#>

[cmdletbinding()]

Param (

[parameter(Mandatory=$true)]
            [ValidateCount(1,5)]
            [String[]]
            $RGName,

[parameter(Mandatory=$true)]
            [ValidateCount(1,5)]
            [String[]]
            $LocName,

[parameter (Mandatory=$true)]
           [ValidateCount(1,5)]
           [string[]]
           $vNetName,

[parameter (Mandatory=$true)]
           [ValidateCount(1,5)]
           [string[]]
           $vNetPrefix,

[parameter (Mandatory=$true)]
           [ValidateCount(1,5)]
           [string[]]
           $vNetSubnets,

[parameter (Mandatory=$true)]
           [ValidateCount(1,5)]
           [string[]]
           $vNetSubnetsPrefixes,

[parameter (Mandatory=$true)]
           [ValidateCount(1,5)]
           [string[]]
           $stName

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

break

Write-Host ""

}
else{

Write-Host " The Azure PowerShell is Installed" -ForegroundColor Yellow

}

Start-Sleep -Seconds 10

cls #Clean the screen

#Colecting Azure Subscripton

Write-Host ""
Write-Host "Connecting to your Azure Subscription" -ForegroundColor Yellow
Write-Host ""

Login-AzureRmAccount | Out-Null ; Add-AzureAccount | Out-Null


#Selecting Azure Location

$hash = Get-AzureLocation | Group-Object DisplayName -AsHashTable
    
#Add an index number for each location
    
$counter = 0

foreach($key in $($hash.keys)){
        $counter++
        $hash[$key] = $counter
    }

    
#Display the list, and ask for the index number
    
$hash
    
Write-Host -NoNewline "Enter the number (value) of the Azure region to use: "  -ForegroundColor Magenta; $locationnumber=read-host 

#Display the chosen location
    
$global:location = $hash.Keys | ? { $hash[$_] -eq $locationnumber }
    
Write-Host "Your Azure region is: " $global:location -ForegroundColor Green








#Create Resource Group






#Create vNET




#Create Storage Account



# Create VM

  #Selection VM Size






}