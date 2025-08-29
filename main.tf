provider "azurerm" { 
 tenant_id   = var.tenant_id
 subscription_id = var.subscription_id
 resource_provider_registrations = "none"
 features {} 
} 

# Create Storage Account 
resource "azurerm_storage_account" "sg1" { 
 name      =  "storageaccount1iac" 
 resource_group_name   =  var.rg_name
 location     =  var.location
 account_tier    =  "Standard" 
 account_replication_type =  "LRS" 
 allow_nested_items_to_be_public = true 
} 

# Create a Blob 
resource "azurerm_storage_container" "newcontainer1" { 
 name     =  "containeriiac" 
 storage_account_id =  azurerm_storage_account.sg1.id
 container_access_type =  "blob" 
} 

