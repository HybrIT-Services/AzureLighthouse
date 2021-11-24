$subs = Get-AzSubscription
foreach ($sub in $subs) {

    Select-AzSubscription -SubscriptionId $sub.Id
    New-AzSubscriptionDeployment -location uksouth -TemplateURI .\HybrITLightHouse.json
}