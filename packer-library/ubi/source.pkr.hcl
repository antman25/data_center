source "docker" "ubi8" {
    image = "nexus.antlinux.local:8443/vendor-base/ubi8/ubi:8.4-213"
    commit = true
    changes = []
}
