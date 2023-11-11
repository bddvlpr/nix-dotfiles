{config, ...}: {
  services = {
    grafana = {
      enable = true;
      settings = {
        server = {
          domain = "alpha.bddvlpr.com";
          root_url = "%(protocol)s://%(domain)s:%(http_port)s/monitor";
          serve_from_sub_path = true;
        };
      };
    };

    prometheus = {
      enable = true;
      port = 9001;
      retentionTime = "62d";
      exporters = {
        node = {
          enable = true;
          enabledCollectors = [
            "arp"
            "bcache"
            "bonding"
            "conntrack"
            "cpu"
            "cpufreq"
            "diskstats"
            "ethtool"
            "entropy"
            "filefd"
            "filesystem"
            "hwmon"
            "interrupts"
            "ksmd"
            "loadavg"
            "logind"
            "mdadm"
            "meminfo"
            "netdev"
            "netstat"
            "os"
            "stat"
            "sysctl"
            "systemd"
            "time"
            "vmstat"
          ];
          port = 9002;
        };
      };
      scrapeConfigs = [
        {
          job_name = "node";
          static_configs = [
            {
              targets = ["127.0.0.1:${toString config.services.prometheus.exporters.node.port}" "192.168.101.4:3000"];
            }
          ];
        }
      ];
    };

    nginx.virtualHosts."alpha.bddvlpr.com" = {
      forceSSL = true;
      enableACME = true;
      locations."/monitor" = {
        proxyPass = "http://127.0.0.1:${toString config.services.grafana.settings.server.http_port}";
        proxyWebsockets = true;
      };
    };
  };
  environment.persistence."/nix/persist".directories = [
    {
      directory = "/var/lib/grafana";
      user = "grafana";
      group = "grafana";
    }
    {
      directory = "/var/lib/prometheus2";
      user = "prometheus";
      group = "prometheus";
    }
  ];
}
