job "plex" {
  datacenters = ["BootstrapDC"]
  group "plex" {

    volume "media" {
      type = "host"
      read_only = true
      source = "/mnt/scratch/test"
    }

    task "plex" {
      driver = "docker"

      volume_mount {
        volume      = "media"
        destination = "/config"
      }

      config {
        image = "linuxserver/plex"
        network_mode = "bridge"
      }

      resources {
        cpu    = 2000
        memory = 2048
        network {
          mbits = 1000
        }
      }

      env {
        PUID = "1000"
        PGID = "100"
        VERSION = "docker"
        UMASK_SE = "022"
        PLEX_CLAIM = ""
        LOCAL_NETWORK="10.0.0.0/8"
      }

      service {
        name = "plex"
        port = 32400
        address_mode = "driver"
        check {
          name     = "host-ldap-check"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
          port     = 32400
          address_mode = "driver"
        }
      }
    }
  }
}
