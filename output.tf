output "vsphere_datacenter" {
  value = "${data.vsphere_datacenter.dc.id}"
}

output "vsphere_hosts" {
  value = "${data.vsphere_host.host.id}"
}
