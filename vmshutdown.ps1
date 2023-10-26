# Authenticate to Azure using the Managed Identity
Connect-AzAccount -Identity

# Specify your Azure Subscription
$SubscriptionId = "4bf0134a-edc2-4d78-b103-310d1f4c0a9d"
Select-AzSubscription -SubscriptionId $SubscriptionId

# Specify the tag key and value to filter VMs
$TagKey = "shutdown_schedule"
$TagValue = "weekend"

# Get VMs with the specified tag
$VMs = Get-AzVM | Where-Object { $_.Tags["$TagKey"] -eq $TagValue }

# Stop VMs
foreach ($VM in $VMs) {
    $VMName = $VM.Name
    $ResourceGroupName = $VM.ResourceGroupName
    Write-Output "Stopping VM: $VMName in Resource Group: $ResourceGroupName"
    Stop-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -Force
}