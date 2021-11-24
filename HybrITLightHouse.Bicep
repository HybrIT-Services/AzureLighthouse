param mspOfferName string = 'HybrIT IT Services'
param mspOfferDescription string = 'HybrIT Consulting Services'
param managedByTenantId string = '065cf743-5dc7-407b-9646-48f60f4736f9'
param authorizations array = [
  {
    'principalId': 'd31192cd-e9fd-4917-bc1f-cceb0fa03ea3'
    'principalIdDisplayName': 'Lighthouse - Azure Privilege Contributors'
    'roleDefinitionId': 'b24988ac-6180-42a0-ab88-20f7382dd24c'
  }
  {
    // 
    'principalId': 'd31192cd-e9fd-4917-bc1f-cceb0fa03ea3'
    'principalIdDisplayName': 'Lighthouse - Azure Privilege Contributors'
    'roleDefinitionId': '91c1777a-f3dc-4fae-b103-61d183457e46'
  }
  {
    // Give permission to assign roles to Managed Identities to the 'Lighthouse - Azure Privilege Contributors'
    'principalId': 'd31192cd-e9fd-4917-bc1f-cceb0fa03ea3'
    'principalIdDisplayName': 'Policy Automation Account'
    'roleDefinitionId': '18d7d88d-d35e-4fb5-a5c3-7773c20a72d9'
    'delegatedRoleDefinitionIds': [
        'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
  }
]

var mspRegistrationName = guid(mspOfferName)
var mspAssignmentName = guid(mspOfferName)

resource mspRegistration_resource 'Microsoft.ManagedServices/registrationDefinitions@2020-02-01-preview' = {
  name: mspRegistrationName
  properties: {
    description: mspOfferDescription
    registrationDefinitionName:mspRegistrationName
    managedByTenantId: managedByTenantId
    authorizations: authorizations
    
  }
}

resource mspAssignment_resource 'Microsoft.ManagedServices/registrationAssignments@2020-02-01-preview' = {
  name: mspAssignmentName
  properties: {
    registrationDefinitionId: mspRegistration_resource.id
  }
}

output mspOffer_output string = 'Managed by ${mspOfferName}'
output authorizations_output array = authorizations
