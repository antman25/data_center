repo_username = "packer"
repo_password = "packer"
ssh_username = "packer"
ssh_password = "packer"
repo_iso_filepath =  "centos8/CentOS-8.2.2004-x86_64-dvd1.iso"
os_version = "8.2.2004"
iso_checksum = "47dc26d76e566280cc47437fd2466134"
kickstart_filename = "ks_centos8.cfg"
boot_command = "<tab><bs><bs><bs><bs><bs>text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait30><esc><wait>"
extra_commands = [	"dnf clean all",
                    "sync"]

