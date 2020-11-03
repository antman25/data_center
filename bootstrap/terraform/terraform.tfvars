# VMware VMs configuration #
vm-count = "1"
vm-name = "servertest"
vm-template-name = "CentOS8-Template"
vm-cpu = "2"
vm-ram = "4096"
vm-guest-id = "centos8_64Guest"
# VMware vSphere configuration #
# VMware vCenter IP/FQDN
vsphere-vcenter = "10.0.0.200"
# VMware vSphere username used to deploy the infrastructure
vsphere-user = "administrator@antlinux.local"
# VMware vSphere password used to deploy the infrastructure
vsphere-password = "qwe123QWE!@#"
# Skip the verification of the vCenter SSL certificate (true/false)
vsphere-unverified-ssl = "true"
# vSphere datacenter name where the infrastructure will be deployed 
vsphere-datacenter = "ant-dc"
# vSphere cluster name where the infrastructure will be deployed
vsphere-cluster = "PrimaryCluster"
# vSphere Datastore used to deploy VMs 
vm-datastore = "antlun"
# vSphere Network used to deploy VMs 
vm-network = "VM Network"
# Linux virtual machine domain name
vm-domain = "antlinux.local"
