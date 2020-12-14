data_dir  = "/var/lib/nomad"

bind_addr = "0.0.0.0" # the default

datacenter = "BootstrapDC"

advertise {
    # Defaults to the first private IP address.
    http = "10.0.0.50"
    rpc  = "10.0.0.50"
    serf = "10.0.0.50:4648" # non-default ports may be specified
}

server {
    enabled          = true
    bootstrap_expect = 1
}

client {
    enabled       = true
    # https://github.com/hashicorp/nomad/issues/1282
    # network_speed = 100
    servers = ["10.0.0.50:4647"]
    # network_interface = "ens192"
    # https://www.nomadproject.io/docs/drivers/docker.html#volumes
    # https://github.com/hashicorp/nomad/issues/5562
    options = {
        "docker.volumes.enabled" = true
    }

    host_volume "test_volume" {
        path = "/mnt/scratch/test"
        read_only = false
    }

    host_volume "media_volume" {
        path = "/mnt/media"
            read_only = false
    }

    host_volume "plex_appdata" {
        path = "/mnt/media/appdata/plex"
        read_only = false
    }

    host_volume "plex_media_tv" {
        path = "/mnt/media/media/tv"
        read_only = false
    }

    host_volume "plex_media_movies" {
        path = "/mnt/media/media/movies"
        read_only = false
    }

    host_volume "downloads_root"
    {
        path = "/mnt/media/downloads/"
        read_only = false
    }

    host_volume "downloads_completed"
    {
        path = "/mnt/media/downloads/completed"
        read_only = false
    }


    host_volume "downloads_watch"
    {
        path = "/mnt/media/downloads/watch"
        read_only = false
    }

    host_volume "jackett_config"
    {
        path = "/mnt/media/appdata/jackett"
        read_only = false
    }

    host_volume "radarr_config"
    {
        path = "/mnt/media/appdata/radarr"
        read_only = false
    }

    host_volume "sonarr_config"
    {
        path = "/mnt/media/appdata/sonarr"
        read_only = false
    }
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

consul {
  address = "10.0.0.50:8500"
}