# Define the list of device display names you want to update
$deviceIds = @(
    "<device ID>"
)

# Loop through each device ID and update extensionAttribute1
foreach ($id in $deviceIds) {
    $device = Get-MgDevice -Filter "deviceId eq '$id'"
    if ($device) {
        Update-MgDevice -DeviceId $device.Id -AdditionalProperties @{
            "extensionAttributes" = @{
                "extensionAttribute1" = "<attribute_tag>"
            }
        }
        Write-Host "Updated $id with extensionAttribute1 = <attribute_tag>"
    }
    else {
        Write-Warning "Device $name not found in Entra ID"
    }
}