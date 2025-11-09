resource "azurerm_storage_account" "storage_accounts" {
  for_each                 = var.stgs
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  access_tier              = each.value.access_tier
  is_hns_enabled           = each.value.is_hns_enabled

  tags = lookup(each.value, "tags", {})

  dynamic "network_rules" {
    for_each = lookup(each.value, "network_rules",{}) 
    # for_each =each.value.network_rules
    content {
      default_action             = network_rules.value.default_action
      bypass                     = network_rules.value.bypass
      # virtual_network_subnet_ids = network_rules.value.virtual_network_subnet_ids
      # ip_rules                   = network_rules.value.ip_rules
    }
    
  }
}



