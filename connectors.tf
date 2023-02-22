resource "volterra_network_connector" "internet" {
  name      = format("%s-internet", var.project_prefix)
  namespace   = "system"

  sli_to_slo_snat {
    default_gw_snat = true
  }
  disable_forward_proxy = true
}

resource "volterra_network_connector" "global" {
  name      = format("%s-global", var.project_prefix)
  namespace = "system"

  sli_to_global_dr {
    global_vn {
      namespace = "system"
      name = format("%s-global-nc", var.project_prefix)
    }
  }
  disable_forward_proxy = true
}
