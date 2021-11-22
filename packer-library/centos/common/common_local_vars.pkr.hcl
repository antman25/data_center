locals { 
	timestamp = regex_replace(timestamp(), "[- TZ:]", "")
	vm_path = join("/", [var.folder,  var.build_branch, var.os, var.os_version])
	vm_prefix_name = join("--", [var.build_branch, var.os, var.os_version])
}

