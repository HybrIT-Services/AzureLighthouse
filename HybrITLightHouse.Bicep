param mspOfferName string = 'HybrIT IT Services'
param mspOfferDescription string = 'HybrIT Consulting Services'
param managedByTenantId string = '065cf743-5dc7-407b-9646-48f60f4736f9'
param authorizations array = [
  {
    // Assign Contributor Role to the 'Lighthouse - Azure Privilege Contributors'
    'principalId': 'd31192cd-e9fd-4917-bc1f-cceb0fa03ea3'
    'principalIdDisplayName': 'Lighthouse - Azure Privilege Contributors'
    'roleDefinitionId': 'b24988ac-6180-42a0-ab88-20f7382dd24c'
  }
  {
    // Managed Services Registration assignment to the 'Lighthouse - Azure Privilege Contributors'
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
        '92aaf0da-9dab-42b6-94a3-d43ce8d16293'
    ]
  }
  {
    // Assign Contributor Role to the 'Lighthouse - Azure  Contributors'
    'principalId': '9b380201-5bbc-4dd2-a16c-39e905d4a595'
    'principalIdDisplayName': 'Lighthouse - Azure Contributors'
    'roleDefinitionId': 'b24988ac-6180-42a0-ab88-20f7382dd24c'
  }
  {
    // Assign Reader Role to the 'Lighthouse - Azure  Readers'
    'principalId': '5712b417-9fbb-4bce-80b0-0a2431dd762f'
    'principalIdDisplayName': 'Lighthouse - Azure Readers'
    'roleDefinitionId': 'acdd72a7-3385-48ef-bd42-f606fba81ae7'
  }
  {
    // Assign Virtual Machine Contributor  Role to the 'Lighthouse - Azure Operators'
    'principalId': '2c09140a-aad7-44d3-90cc-f54c001ecf70'
    'principalIdDisplayName': 'Lighthouse - Azure Operators'
    'roleDefinitionId': '9980e02c-c2be-4d73-94e8-173b1dc7cf3c'
  }
  {
    // Assign Backup Operator Role to the 'Lighthouse - Azure Operators'
    'principalId': '2c09140a-aad7-44d3-90cc-f54c001ecf70'
    'principalIdDisplayName': 'Lighthouse - Azure Operators'
    'roleDefinitionId': '00c29273-979b-4161-815c-10b084fb9324'
  }
  {
    // Assign reader Role to the 'Lighthouse - Azure Operators'
    'principalId': '2c09140a-aad7-44d3-90cc-f54c001ecf70'
    'principalIdDisplayName': 'Lighthouse - Azure Operators'
    'roleDefinitionId': 'acdd72a7-3385-48ef-bd42-f606fba81ae7'
  }
  {
    // Assign Log Analytics Contributor Role to the 'Lighthouse - Azure Operators'
    'principalId': '2c09140a-aad7-44d3-90cc-f54c001ecf70'
    'principalIdDisplayName': 'Lighthouse - Azure Operators'
    'roleDefinitionId': '92aaf0da-9dab-42b6-94a3-d43ce8d16293'
  }
  {
    // Assign Monitoring Contributor Role to the 'Lighthouse - Azure Operators'
    'principalId': '2c09140a-aad7-44d3-90cc-f54c001ecf70'
    'principalIdDisplayName': 'Lighthouse - Azure Operators'
    'roleDefinitionId': '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
  }
  {
    // Assign Automation Operator Role to the 'Lighthouse - Azure Operators'
    'principalId': '2c09140a-aad7-44d3-90cc-f54c001ecf70'
    'principalIdDisplayName': 'Lighthouse - Azure Operators'
    'roleDefinitionId': 'd3881f73-407a-4167-8283-e981cbba0404'
  }
  {
    // Assign Automation Runbook Operator Role to the 'Lighthouse - Azure Operators'
    'principalId': '2c09140a-aad7-44d3-90cc-f54c001ecf70'
    'principalIdDisplayName': 'Lighthouse - Azure Operators'
    'roleDefinitionId': '5fb5aef8-1081-4b8e-bb16-9d5d0385bab5'
  }
  {
    // Assign Managed Application Operator Role to the 'Lighthouse - Azure Operators'
    'principalId': '2c09140a-aad7-44d3-90cc-f54c001ecf70'
    'principalIdDisplayName': 'Lighthouse - Azure Operators'
    'roleDefinitionId': 'c7393b34-138c-406f-901b-d8cf2b17e6ae'
  }
  {
    // Assign Site Recovery Operator Role to the 'Lighthouse - Azure Operators'
    'principalId': '2c09140a-aad7-44d3-90cc-f54c001ecf70'
    'principalIdDisplayName': 'Lighthouse - Azure Operators'
    'roleDefinitionId': '494ae006-db33-4328-bf46-533a6560a3ca'
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
