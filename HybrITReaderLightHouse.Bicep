param mspOfferName string = 'HybrIT IT Services'
param mspOfferDescription string = 'HybrIT Reviewing Services'
param managedByTenantId string = '065cf743-5dc7-407b-9646-48f60f4736f9'
param authorizations array = [  
  {
    // Assign Reader Role to the 'Lighthouse - Azure  Readers'
    'principalId': '5712b417-9fbb-4bce-80b0-0a2431dd762f'
    'principalIdDisplayName': 'Lighthouse - Azure Readers'
    'roleDefinitionId': 'acdd72a7-3385-48ef-bd42-f606fba81ae7'
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
