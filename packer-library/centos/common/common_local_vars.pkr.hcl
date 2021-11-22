locals { 
	timestamp = regex_replace(timestamp(), "[- TZ:]", "")
	vm_path = join("/", [var.folder, var.os, var.os_version, var.build_branch])
	vm_prefix_name = join("--", [var.os, var.os_version, var.build_branch])
}

