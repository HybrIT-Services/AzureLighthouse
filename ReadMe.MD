![Hybrit Logo](img/HybrITLogo.png)

# Introduction

This Repository is intended for HybrIT Services Partners to easily and securely provide access to some or all subscriptions in their Azure Tenancy.

The Role base Azure Lighthouse configuration uses Privelege Groups in HybrIT's own AD Tenant. This provides a mechanism to for auditable JIT privilege access at no additional cost to the partner.

https://azure.microsoft.com/en-gb/blog/privileged-identity-management-with-azure-lighthouse-enables-zero-trust/

This Feature was announced by Microsoft July 2021, for further reading please see Microsoft Azure Blog


- [Introduction](#introduction)
- [How to use](#how-to-use)
  - [Apply to Single Subscription](#apply-to-single-subscription)
  - [Apply to All Subscriptions](#apply-to-all-subscriptions)
- [What Roles get assigned and to who?](#what-roles-get-assigned-and-to-who)
  - [Roles](#roles)
  - [HybrIT Groups](#hybrit-groups)
  - [Role Assignment Summary Table](#role-assignment-summary-table)

# How to use

1.  Sign in to your Azure Tenancy using Windows PowerShell. Use an account that has owner rights against any subscriptions you want to enrol in Azure Lighthouse.
```
Connect-AzAccount
```
## Apply to Single Subscription

1.  If you would like to HybrIT to only access a single subscription via Azure Light house check you are connected to the correct subscription

```
Get-AzContext
```
![Get-AzContext](img/get-azcontext.png)

2. If you need to switch subscriptions you can use the below command

```
Select-AzSubscription -SubscriptionId <SubscriptionID>
```

![Select-AzSubscription](img/select-azsubscription.png)

3. Finally run the single powershell command to apply the template from this repository

```
New-AzSubscriptionDeployment -location uksouth -TemplateURI 'https://raw.githubusercontent.com/HybrIT-Services/AzureLighthouse/main/HybrITLightHouse.json'
```

## Apply to All Subscriptions

1.  To apply to all subscription that your signed in user has rights to run the below commands. Firstly check you can see the intented subscriptions from your PowerShell windows

```
Get-AzSubscription
```

You should see a return of the subscriptions you have access to.

![Get-AzSubscription](img/get-azsubscription.png)

2.  Run the below script to assign to all subscriptions

```
$subs = Get-AzSubscription
foreach ($sub in $subs) {

    Select-AzSubscription -SubscriptionId $sub.Id
    New-AzSubscriptionDeployment -location uksouth -TemplateURI 'https://raw.githubusercontent.com/HybrIT-Services/AzureLighthouse/main/HybrITLightHouse.json'
}

```

# What Roles get assigned and to who?

## Roles

The roles JSON template is built form the Bicep file in this repository. The bicep file contains comments to indicate which role is assigned to which group. The comments are intended to quicky interpret which groups get which roles with out the need to cross reference the Role Definition ID Manually. How ever if you would like to double check these roles can be found here.

https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles

## HybrIT Groups

HybrIT are using privlege access groups to provide access into your environment. This means no user or admin will have standing access. To gain access HybrIT's consultants will need to elevate themselves into the group using Privlege Identity Management with in the HybrIT Azure AD Tenant.
This has the benefit of having a full audit trail of who had access and when, additionally it means the licenses required for PIM are assigned within HybrIT's own Azure AD Tenant and incurs no cost to the Partner.

## Role Assignment Summary Table

| Privilelege Access Group                  	| Role Assignment                          	|
|-------------------------------------------	|------------------------------------------	|
| Lighthouse - Azure Privilege Contributors 	| Contributor                              	|
| Lighthouse - Azure Privilege Contributors 	| Managed Services Registration assignment 	|
| Lighthouse - Azure Privilege Contributors 	| Assign roles to Managed Identities       	|
| Lighthouse - Azure Contributors           	| Contributor                              	|
| Lighthouse - Azure Reader                 	| Reader                                   	|
| Lighthouse - Azure Operators              	| Virtual Machine Contributor              	|
| Lighthouse - Azure Operators              	| Backup Operator                          	|
| Lighthouse - Azure Operators              	| Reader                                   	|
| Lighthouse - Azure Operators              	| Log Analytics Contributor                	|
| Lighthouse - Azure Operators              	| Monitoring Contributor                   	|
| Lighthouse - Azure Operators              	| Automation Operator                      	|
| Lighthouse - Azure Operators              	| Automation Runbook Operator              	|
| Lighthouse - Azure Operators              	| Managed Application Operator             	|
| Lighthouse - Azure Operators              	| Site Recovery Operator                   	|
