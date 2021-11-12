repo_username = "packer"
repo_password = "packer"
repo_iso_filepath =  "centos7/CentOS-7.9.2009-x86_64-dvd1.iso"
os_version = "7.9.2009"
iso_checksum = "8f8c832372b4b6d84076847b8d99b2ad"
kickstart_filename = "ks_centos7.cfg"
boot_command = "<tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait10><esc><wait>"
extra_commands = [	"yum clean all",
                    "sync"]