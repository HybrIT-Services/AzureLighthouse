param mspOfferName string = 'RPC Tyche IT Services'
param mspOfferDescription string = 'RPC Tyche Reviewing Services'
param managedByTenantId string = 'xxx-xxxx-xxx-xxx'
param authorizations array = [  
  {
    // Assign Reader Role to the 'Craig Hawthorn'
    'principalId': 'xxxx-xxxxx-xxxx-xxxx-xxxx'
    'principalIdDisplayName': 'Craig Hawthorn'
    'roleDefinitionId': 'acdd72a7-3385-48ef-bd42-f606fba81ae7'
  }
  {
    // Assign Reader Role to the 'Craig Hawthorn'
    'principalId': 'xxxx-xxxxx-xxxx-xxxx-xxxx'
    'principalIdDisplayName': 'Craig Hawthorn'
    'roleDefinitionId': 'fa23ad8b-c56e-40d8-ac0c-ce449e1d2c64'
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
