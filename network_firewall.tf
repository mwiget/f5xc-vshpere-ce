resource "volterra_network_firewall" "nfw" {
  name      = format("%s-vsphere-firewall", var.project_prefix)
  namespace = "system"

  # disable_network_policy = true
  active_network_policies {
    network_policies {
      name = "block-unauthorized-countries"
      namespace = "system"
    }
    network_policies {
      name = "allow-all"
      namespace = "system"
    }
  }

  # disable_forward_proxy_policy = true
  active_forward_proxy_policies {
    forward_proxy_policies {
      name = "allow-all-urls"
      namespace = "system"
    }
  }

  disable_fast_acl = true
}
