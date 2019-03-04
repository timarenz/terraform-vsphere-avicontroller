data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_vm_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_cluster}/${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_vm_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vsphere_vm_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "avicontroller" {
  name             = "${var.avicontroller_name}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = "${var.vm_vcpu}"
  memory   = "${var.vm_memory * 1024}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = "${var.vm_disk}"
  }

  #   cdrom {
  #     client_device = true
  #   }

  vapp {
    properties {
      #   guestinfo.avi.mgmt-ip.CONTROLLER             = "${var.avicontroller_ip_address}"
      #   guestinfo.avi.mgmt-mask.CONTROLLER           = "${var.avicontroller_netmask}"
      #   guestinfo.avi.default-gw.CONTROLLER          = "${var.avicontroller_gateway}"
      #   guestinfo.avi.sysadmin-public-key.CONTROLLER = "${var.avicontroller_public_key}"
      guestinfo.test = "test123"
    }
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
  }
}
