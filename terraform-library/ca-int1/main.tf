provider "vault" {
	address = "http://vault.antlinux.local:8200"
	token="s.qay3tSOrO3heR9cJRjCOHB0K"
}


locals {
 default_3y_in_sec   = 94608000
 default_1y_in_sec   = 31536000
 default_1hr_in_sec = 3600
}

