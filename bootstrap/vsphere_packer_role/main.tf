variable vsphere_user {
  type = string
}

variable vsphere_pass {
  type = string
}

variable vsphere_addr {
  type = string
}


provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_pass
  vsphere_server = var.vsphere_addr

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "ant-dc"
}

data "vsphere_role" "role1" {
  label = "Datastore consumer (sample)"
}

resource vsphere_role "role1" {
  name = "packer_test_role"
  role_privileges = [	
			"Datastore.AllocateSpace",
			"Datastore.Browse",
			"Datastore.FileManagement",

			"Network.Assign",

			"Resource.AssignVMToPool",
	
			"VirtualMachine.Config.AddNewDisk",
			"VirtualMachine.Config.AddRemoveDevice",
			"VirtualMachine.Config.AdvancedConfig",
			"VirtualMachine.Config.Annotation",
			"VirtualMachine.Config.CPUCount",
			"VirtualMachine.Config.Memory",
			"VirtualMachine.Config.Resource",
			"VirtualMachine.Config.Settings",


			"VirtualMachine.Inventory.Create",
			"VirtualMachine.Inventory.Register",
			"VirtualMachine.Inventory.Delete",
			"VirtualMachine.Inventory.Unregister",
				

			"VirtualMachine.Interact.ConsoleInteract",
			"VirtualMachine.Interact.DeviceConnection",
			"VirtualMachine.Interact.PowerOff",
			"VirtualMachine.Interact.PowerOn",
			"VirtualMachine.Interact.PutUsbScanCodes",
			"VirtualMachine.Interact.SetCDMedia",
			"VirtualMachine.Interact.SetFloppyMedia",



			"VirtualMachine.Provisioning.MarkAsTemplate",

			"VirtualMachine.State.CreateSnapshot"
		]
}

/*variable "hosts" {
  default = [
    "10.0.0.111",
    "10.0.0.222"
  ]
}*/

data "vsphere_host" "host" {
  name          = "10.0.0.111"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

/*(data "vsphere_host" "esxi_hosts" {
  count         = "${length(var.hosts)}"
  name          = "${var.hosts[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}*/

resource "vsphere_nas_datastore" "datastore" {
  name            = "terraform-test"
  host_system_ids = ["${data.vsphere_host.host.id}"]

  type         = "NFS"
  remote_hosts = ["10.0.0.164"]
  remote_path  = "/data/scratch/datastore"
}


resource "vsphere_entity_permissions" p1 {
  entity_id = vsphere_nas_datastore.datastore.id
  entity_type = "Datastore"
  permissions {
    user_or_group = "antlinux.local\\pipeline"
    propagate = false
    is_group = true
    role_id = vsphere_role.role1.id
  }
}

