resource "volterra_virtual_network" "inside" {
  name      = format("%s-inside", var.project_prefix)
  namespace = "system"
  site_local_inside_network = true
}

resource "volterra_virtual_network" "outside" {
  name      = format("%s-outside", var.project_prefix)
  namespace = "system"
  site_local_network = true
}

