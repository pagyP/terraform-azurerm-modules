

resource "azurerm_firewall_policy" "fwpol" {
  base_policy_id = var.base_policy_id
  location = var.location
  name = var.name
  resource_group_name = var.resource_group_name
  sku = var.sku
  tags = var.tags
  threat_intelligence_mode = var.threat_intelligence_mode

  dynamic "dns" {
    for_each = var.dns
    content {
      # network_rule_fqdn_enabled - (optional) is a type of bool
      #network_rule_fqdn_enabled = dns.value["network_rule_fqdn_enabled"]
      # proxy_enabled - (optional) is a type of bool
      proxy_enabled = dns.value["proxy_enabled"]
      # servers - (optional) is a type of set of string
      servers = dns.value["servers"]
    }
  }

  dynamic "threat_intelligence_allowlist" {
    for_each = var.threat_intelligence_allowlist
    content {
      fqdns = threat_intelligence_allowlist.value["fqdns"]
      ip_addresses = threat_intelligence_allowlist.value["ip_addresses"]
    }
  }

  
}