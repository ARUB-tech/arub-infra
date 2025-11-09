variable "stgs" {
    type = map(object({
      name = string
      resource_group_name =string
      location = string
      account_tier =string
      account_replication_type = string
      access_tier = optional(string, "Hot")
      is_hns_enabled = optional(bool, false)
      tags = optional(map(string))
      network_rules = optional(object({
        default_action = string
        bypass = optional(list(string))
        # virtual_network_subnet_ids = optional(list(string))
        # ip_rules = optional(list(string))
      }))
  
      
    }))
}