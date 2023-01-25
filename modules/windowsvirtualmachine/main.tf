
resource "azurerm_network_interface" "main" {
  for_each                      = toset(var.vm_names)
  name                          = "${each.value}-nic"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  enable_accelerated_networking = var.enable_accelerated_networking
  enable_ip_forwarding          = var.enable_ip_forwarding

  ip_configuration {
    name                          = "${each.value}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_managed_disk" "main" {
  for_each             = toset(var.vm_names)
  name                 = "${each.value}-datadisk"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.data_disk_type
  create_option        = "Empty"
  disk_size_gb         = var.data_disk_size_gb
  tags                 = var.tags


}

resource "azurerm_windows_virtual_machine" "main" {
  for_each              = toset(var.vm_names)
  name                  = each.value
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main[each.key].id]
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  timezone              = var.time_zone

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  os_disk {
    name    = "${each.key}-osdisk"
    caching = var.os_disk_caching
    #create_option     = "FromImage"
    #managed_disk_type = var.os_disk_type
    storage_account_type = var.os_disk_type
  }





  tags = var.tags

}

resource "azurerm_virtual_machine_data_disk_attachment" "main" {
    for_each = toset(var.vm_names)
    managed_disk_id    = azurerm_managed_disk.main[each.key].id
    virtual_machine_id = azurerm_windows_virtual_machine.main[each.key].id
    lun                = 0   
    caching            = var.data_disk_caching
  
}