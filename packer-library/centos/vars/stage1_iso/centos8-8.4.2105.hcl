repo_username = "packer"
repo_password = "packer"
repo_iso_filepath = "centos8/CentOS-8.4.2105-x86_64-dvd1.iso"
os_version = "8.4.2105"
iso_checksum = "d0f515715e370e1564f33856cb208577"
kickstart_filename = "ks_centos8.cfg"
boot_command = "<tab><bs><bs><bs><bs><bs>text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait10><esc><wait>"
extra_commands = [	"dnf clean all",
                        "sync"]

