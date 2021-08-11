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

#data "vsphere_role" "role1" {
#  label = "Datastore consumer (sample)"
#}

resource vsphere_role "packer_role" {
  name = "packer_test_role"
  role_privileges = [	
			"Datastore.AllocateSpace",
			"Datastore.Browse",
			"Datastore.FileManagement",

			"Folder.Create",

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

#data "vsphere_role" "packer_test_role" {
#  label = "packer automation testing"
#}


data "vsphere_host" "host" {
  name          = "10.0.0.111"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_nas_datastore" "datastore" {
  name            = "terraform-test"
  host_system_ids = [data.vsphere_host.host.id]

  type         = "NFS"
  remote_hosts = ["10.0.0.164"]
  remote_path  = "/data/scratch/datastore"
}

resource "vsphere_folder" "pipeline_base_folder" {
  path          = "pipeline"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}


resource "vsphere_entity_permissions" datastore_perm {
  entity_id = vsphere_nas_datastore.datastore.id
  entity_type = "Datastore"
  permissions {
    user_or_group = "antlinux.local\\packer_role_test"
    propagate = true
    is_group = false
    role_id = vsphere_role.packer_role.id
  }
}

resource "vsphere_entity_permissions" host_perm {
  entity_id = data.vsphere_host.host.id
  entity_type = "HostSystem"
  permissions {
    user_or_group = "antlinux.local\\packer_role_test"
    propagate = false
    is_group = false
    role_id = vsphere_role.packer_role.id
  }
}

/*resource "vsphere_entity_permissions" datacenter_perm {
  entity_id = data.vsphere_datacenter.dc.id
  entity_type = "Datacenter"
  permissions {
    user_or_group = "antlinux.local\\packer_role_test"
    propagate = false
    is_group = false
    role_id = vsphere_role.packer_role.id
  }
}*/

resource "vsphere_entity_permissions" folder_perm {
  entity_id = vsphere_folder.pipeline_base_folder.id
  entity_type = "Folder"
  permissions {
    user_or_group = "antlinux.local\\packer_role_test"
    propagate = true
    is_group = false
    role_id = vsphere_role.packer_role.id
  }
}
