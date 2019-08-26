provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "qnp-ast"
}

data "vsphere_datastore" "datastore1" {
  name          = "datastore1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_datastore" "datastore2" {
  name          = "datastore1 (1)"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_datastore" "datastore3" {
  name          = "datastore1 (2)"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_datastore" "datastore4" {
  name          = "soft.qnp.kz"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

# data "vsphere_resource_pool" "pool" {
#   name          = "cluster1/Resources"
#   datacenter_id = "${data.vsphere_datacenter.dc.id}"
# }

data "vsphere_network" "network" {
  name          = "VM Internet"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_host" "host" {
  name          = "esx1.qnp.kz"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
