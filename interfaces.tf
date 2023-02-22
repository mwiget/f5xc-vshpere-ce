resource "volterra_network_interface" "eth0" {
  name      = format("%s-eth0", var.project_prefix)
  namespace   = "system"
  description = "WAN/SLO interface with Internet access"

  ethernet_interface {
    device = "eth0"
    is_primary = true
    monitor_disabled = true    
  }
}

resource "volterra_network_interface" "eth1" {
  name      = format("%s-eth1", var.project_prefix)
  namespace   = "system"
  description = "LAN/SLI interface"

  ethernet_interface {
    device = "eth1"
    dhcp_client = true

    #    dhcp_server {
    #  dhcp_networks {
    #    network_prefix = "192.168.40.0/24"
    #    pool_settings = "INCLUDE_IP_ADDRESSES_FROM_DHCP_POOLS"
    #    first_address = true
    #    same_as_dgw = true
    #  }
    #  fixed_ip_map = {
    #    "3c:ec:ef:45:3b:30" = "192.168.40.100"
    #  }
    #  automatic_from_start = true
    #}

    is_primary = true
    site_local_inside_network = true
    monitor_disabled = true    
  }
}

