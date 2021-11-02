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

data "vsphere_compute_cluster" "compute_cluster" {
  name          = "PrimaryCluster"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource vsphere_role "packer_role" {
  name = "packer_test_role"
  role_privileges = [	
			"Datastore.AllocateSpace",
			"Datastore.Browse",
			"Datastore.FileManagement",

			"Folder.Create",
			"Folder.Delete",
			"Folder.Rename",

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
			"VirtualMachine.Inventory.CreateFromExisting",				

			"VirtualMachine.Interact.ConsoleInteract",
			"VirtualMachine.Interact.DeviceConnection",
			"VirtualMachine.Interact.PowerOff",
			"VirtualMachine.Interact.PowerOn",
			"VirtualMachine.Interact.PutUsbScanCodes",
			"VirtualMachine.Interact.SetCDMedia",
			"VirtualMachine.Interact.SetFloppyMedia",

                        "VirtualMachine.Provisioning.Clone",
			"VirtualMachine.Provisioning.MarkAsTemplate",

			"VirtualMachine.State.CreateSnapshot"
		]
}


data "vsphere_host" "host" {
  name          = "esxi1.antlinux.local"
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

data "vsphere_network" "switch" {
  name           = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_entity_permissions" datastore_perm {
  entity_id = vsphere_nas_datastore.datastore.id
  entity_type = "Datastore"
  permissions {
    user_or_group = "antlinux\\packer-svc"
    propagate = true
    is_group = false
    role_id = vsphere_role.packer_role.id
  }
}

resource "vsphere_entity_permissions" host_perm {
  entity_id = data.vsphere_host.host.id
  entity_type = "HostSystem"
  permissions {
    user_or_group = "antlinux\\packer-svc"
    propagate = false
    is_group = false
    role_id = vsphere_role.packer_role.id
  }
}

resource "vsphere_entity_permissions" folder_perm {
  entity_id = vsphere_folder.pipeline_base_folder.id
  entity_type = "Folder"
  permissions {
    user_or_group = "antlinux\\packer-svc"
    propagate = true
    is_group = false
    role_id = vsphere_role.packer_role.id
  }
}

resource "vsphere_entity_permissions" network_perm {
  entity_id = data.vsphere_network.switch.id
  entity_type = "Network"
  permissions {
    user_or_group = "antlinux\\packer-svc"
    propagate = false
    is_group = false
    role_id = vsphere_role.packer_role.id
  }
}

resource "vsphere_entity_permissions" cluster_perm {
  entity_id = data.vsphere_compute_cluster.compute_cluster.id
  entity_type = "ClusterComputeResource"
  permissions {
    user_or_group = "antlinux\\packer-svc"
    propagate = false
    is_group = false
    role_id = vsphere_role.packer_role.id
  }
}

/*resource "vsphere_entity_permissions" datacenter_perm {
  entity_id = data.vsphere_datacenter.dc.id
  entity_type = "Datacenter"
  permissions {
    user_or_group = "antlinux\\packer-svc"
    propagate = true
    is_group = false
    role_id = vsphere_role.packer_role.id
  }
}*/
