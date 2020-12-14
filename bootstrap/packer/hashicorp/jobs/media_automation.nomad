job "media_automation" {
  datacenters = ["BootstrapDC"]
  group "plex" {

    volume "app_data" {
      type = "host"
      read_only = false
      source = "plex_appdata"
    }

    volume "media_tv" {
      type = "host"
      read_only = false
      source = "plex_media_tv"
    }

    volume "media_movies" {
      type = "host"
      read_only = false
      source = "plex_media_movies"
    }

    task "plex" {
      driver = "docker"

      volume_mount {
        volume      = "app_data"
        destination = "/config"
      }

      volume_mount {
        volume      = "media_tv"
        destination = "/tv"
      }

      volume_mount {
        volume      = "media_movies"
        destination = "/movies"
      }

      config {
        image = "linuxserver/plex"
        network_mode = "host"
      }

      resources {
        cpu    = 2000
        memory = 2048
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
          name     = "host-plex-check"
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
