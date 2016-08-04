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
            $global:location,

[parameter (Mandatory=$true)]
           [ValidateCount(1,5)]
           [string[]]
           $NSGName,

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

Start-Sleep -Seconds 5

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
    
Write-Host -NoNewline "Enter the number (value) of the Azure region to use: "  -ForegroundColor Magenta ; $locationnumber=read-host 

#Display the chosen location
    
$global:location = $hash.Keys | ? { $hash[$_] -eq $locationnumber }
    
Write-Host "Your Azure region is: " $global:location -ForegroundColor Green



#Create Resource Group

Write-Host ""
Write-Host "Creating The Resource Group" -ForegroundColor Yellow
Write-Host ""
Write-Host "Enter the Resource Group Name: " -ForegroundColor Magenta -NoNewline ; $RGName = Read-Host

New-AzureRmResourceGroup -Name $RGName -Location $global:location

Start-Sleep -Seconds 5

#Create vNET

Write-Host ""
Write-Host "Creating The Virtual Network (vNET)" -ForegroundColor Yellow
Write-Host ""
Write-Host "Enter the Virtual Network Name:" -ForegroundColor Magenta -NoNewline ; $vNetName = Read-Host
Write-Host "Enter The AddressPrefix of vNET: " -ForegroundColor Magenta -NoNewline ; $vNetPrefix = Read-Host
Write-Host "Enter The Subnet Name:" -ForegroundColor Magenta -NoNewline ; $vNetSubnets = Read-Host
Write-Host "Enter The Subnet AddressPrefix:" -ForegroundColor Magenta -NoNewline ; $vNetSubnetsPrefixes = Read-Host

$singleSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name $vNetSubnets -AddressPrefix $vNetSubnetsPrefixes

$vnet = New-AzureRmVirtualNetwork -Name $vNetName -ResourceGroupName $RGName -AddressPrefix $vNetPrefix -Location $global:location -Subnet $singleSubnet

Set-AzureRMVirtualNetwork –VirtualNetwork $vnet

Start-Sleep -Seconds 5

#Create a NSG

    # 1º Create Basics Rule to ensure External Access

     $rule1 = New-AzureRmNetworkSecurityRuleConfig -Name Rule_External_Access -Description "Permit RDP Access" `
    -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 `
    -SourceAddressPrefix Internet -SourcePortRange * `
    -DestinationAddressPrefix VirtualNetwork -DestinationPortRange 3389


    #Create The NSG

    Write-Host ""
    Write-Host "Creating The Network Security Group (NSG)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Enter The NSG Name:" -ForegroundColor Magenta -NoNewline ; $NSGName = Read-Host

    $NSG = New-AzureRmNetworkSecurityGroup -ResourceGroupName $RGName -Location $global:location -Name $NSGName -SecurityRules $rule1

    #Associte The NSG with vNET


    Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $vNetSubnets  -AddressPrefix $vNetSubnetsPrefixes   -NetworkSecurityGroup $NSG
    
    Set-AzureRMVirtualNetwork –VirtualNetwork $vnet


#Create Storage Account

 Write-Host ""
 Write-Host "Creating The Azure Storage Account" -ForegroundColor Yellow
 Write-Host ""


#Select Storage Account Type

Write-Host "Choose a Storage Type:" -ForegroundColor Yellow
Write-Host ""
Write-Host " 1-Standard_LRS " -ForegroundColor Green
Write-Host " 2-Standard_ZRS " -ForegroundColor Green
Write-Host " 3-Standard_GRS " -ForegroundColor Green
Write-Host " 4-Standard_RAGRS" -ForegroundColor Green
Write-Host ""
Write-Host "Enter The number of your Choose:" -ForegroundColor Magenta -NoNewline ; $Sttype = Read-Host

switch ($Sttype) {

             1 { $Stype = "Standard_LRS" }
             2 {$Stype = "Standard_ZRS"}
             3 {$Stype = "Standard_GRS"}
             4 {$Stype = "Standard_RAGRS"}

}


Write-Host "Enter The Azure Storage Account Name" -NoNewline -ForegroundColor Magenta ; Write-Host "(ex. storage003)" -NoNewline ;Write-Host ":" -NoNewline -ForegroundColor Magenta ; $stName = Read-Host
New-AzureRmStorageAccount -ResourceGroupName $RGName -Name $stName -location $global:location -AccountType $Stype



# Create VM

  #Selection VM Size

Write-Host ""
Write-Host "Creating a New VM" -ForegroundColor Yellow
Write-Host ""
Write-Host "Choose an Azure VM Size" -ForegroundColor Magenta


$out =@()
$LocName = $global:location
$VMAzureSizes = Get-AzureRoleSize 
$AzureLocationReousrce = Get-AzureLocation | where {$_.Name -eq $LocName} # Colete All Resource within specific Azure Location
$VirtualMachineRoleSizes = $AzureLocationReousrce.VirtualMachineRoleSizes 

$counter = 0

foreach ($ASize in $VirtualMachineRoleSizes){
  
    
   foreach ($VMSize in ($VMAzureSizes | Where {$_.InstanceSize -eq $ASize} )){
  
    $hash = $VMSize | Group-Object -Property RoleSizeLabel -AsHashTable
       
     foreach($key in $($hash.Keys)){ 
        
        $counter++
        $hash[$key] = $counter

        $out+= $hash
    
         }
     
     }
    
   }

#Display the list, and ask for the index number

$out |  Format-Table -AutoSize


#Select an Valeu Number
    
Write-Host ""
    
Write-Host -NoNewline "Enter the number (value) of the Azure VM Size that you want: "  -ForegroundColor Magenta ; $VMSizenumber=read-host 

#Display the chosen location
    
$global:Size = $hash.Keys | ? { $hash[$_] -eq $VMSizenumber }
Write-Host""    
Write-Host "Your Azure VM Size is: " $global:Size -ForegroundColor Green




}