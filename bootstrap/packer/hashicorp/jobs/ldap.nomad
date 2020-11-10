job "ldap" {
  datacenters = ["BootstrapDC"]
  group "ldap" {

    task "ldap" {
      driver = "docker"

      config {
        image = "rroemhild/test-openldap"
        network_mode = "bridge"
      }

      network {
        mode = "bridge"

        port "ldap" {
          static = 389
          to     = 389
        }
      }

      resources {
        cpu    = 500
        memory = 512
        network {
          mbits = 10
        }
      }

      service {
        name = "ldap"
        port = 389
        address_mode = "driver"
        check {
          name     = "host-ldap-check"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
          port     = 389

          address_mode = "driver"
        }
      }
    }
  }
}
