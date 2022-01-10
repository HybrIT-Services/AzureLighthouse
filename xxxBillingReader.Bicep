param mspOfferName string = 'RPC Tyche IT Services'
param mspOfferDescription string = 'RPC Tyche Reviewing Services'
param managedByTenantId string = 'b4e49ba2-91d6-42b8-a52b-41edd5c0d6d8'
param authorizations array = [  
  {
    // Assign Reader Role to the 'Craig Hawthorn'
    'principalId': 'ad5b8b5a-63bd-4b6b-a145-086136cd976e'
    'principalIdDisplayName': 'Admin_Craig Hawthorne'
    'roleDefinitionId': 'acdd72a7-3385-48ef-bd42-f606fba81ae7'
  }
  {
    // Assign Billing Reader Role to the 'Craig Hawthorn'
    'principalId': 'ad5b8b5a-63bd-4b6b-a145-086136cd976e'
    'principalIdDisplayName': 'Admin_Craig Hawthorne'
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
