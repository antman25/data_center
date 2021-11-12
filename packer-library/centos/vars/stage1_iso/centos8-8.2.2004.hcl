repo_username = "packer",
repo_password = "packer",
repo_iso_filepath =  "centos8/CentOS-8.2.2004-x86_64-dvd1.iso",
os_version = "8.2.2004",
iso_checksum = "47dc26d76e566280cc47437fd2466134",
kickstart_filename = "ks_centos8.cfg",
boot_command = "<tab><bs><bs><bs><bs><bs>text ks=ks=hd:fd0:/${var.kickstart_filename}<enter>",
extra_commands = [	"dnf clean all",
                    "dd if=/dev/zero of=/EMPTY bs=1M",
                    "rm -f /EMPTY",
                    "sync"]

