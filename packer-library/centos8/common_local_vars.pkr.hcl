locals { 
	timestamp = regex_replace(timestamp(), "[- TZ:]", "")
	full_iso_url = join("", [var.repo_scheme, "://", var.repo_username, ":", var.repo_password, "@", var.repo_iso_base_url, var.repo_iso_filepath])
	vm_path = join("/", [var.folder, var.os, var.os_version, var.build_branch])
}

