param mspOfferName string = 'RPC Tyche IT Services'
param mspOfferDescription string = 'RPC Tyche Reviewing Services'
param managedByTenantId string = '91bfa1fc-4d66-41e2-a256-d94a53097254'
param authorizations array = [  
  {
    // Assign Reader Role to the 'Craig Hawthorn'
    'principalId': 'ad5b8b5a-63bd-4b6b-a145-086136cd976e'
    'principalIdDisplayName': 'Admin_Craig Hawthorne'
    'roleDefinitionId': '7fdc288d-ec03-49ed-b81d-2097cc3b1ec4'
  }
  {
    // Assign Billing Reader Role to the 'Craig Hawthorn'
    'principalId': 'ad5b8b5a-63bd-4b6b-a145-086136cd976e'
    'principalIdDisplayName': 'Admin_Craig Hawthorne'
    'roleDefinitionId': '7fdc288d-ec03-49ed-b81d-2097cc3b1ec4'
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
