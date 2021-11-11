locals { 
	timestamp = regex_replace(timestamp(), "[- TZ:]", "")
	full_iso_url = concat([var.repo_scheme, "://", var.repo_username, ":", var.repo_password, "@", var.repo_iso_base_url, repo_iso_filepath])
	vm_name = concat([var.os, "--", var.os_version, "--", var.build_branch)
}

