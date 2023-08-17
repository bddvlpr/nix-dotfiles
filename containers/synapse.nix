{
  containers.synapse = {
    autoStart = true;
    ephemeral = true;

    privateNetwork = true;
    hostAddress = "192.168.100.1";
    localAddress = "192.168.101.1";

    bindMounts = {
      "/var/lib/matrix-synapse" = {
        hostPath = "/opt/synapse-data";
        isReadOnly = false;
      };
      "/var/lib/postgresql" = {
        hostPath = "/opt/synapse-postgresql";
        isReadOnly = false;
      };
    };

    config = {
      pkgs,
      config,
      ...
    }: {
      services = {
        matrix-synapse = {
          enable = true;

          settings = {
            server_name = "bddvlpr.com";
            database = {
              name = "psycopg2";
            };
            listeners = [
              {
                port = 8080;
                type = "http";
                bind_addresses = ["0.0.0.0"];
                tls = false;
                x_forwarded = true;
                resources = [
                  {
                    names = ["client" "federation"];
                    compress = true;
                  }
                ];
              }
            ];
          };
        };
        postgresql = {
          enable = true;
          initialScript = pkgs.writeText "synapse-init.sql" ''
            CREATE ROLE "matrix-synapse" WITH LOGIN;
            CREATE DATABASE "matrix-synapse" WITH OWNER "matrix-synapse"
              TEMPLATE template0
              LC_COLLATE = "C"
              LC_CTYPE = "C";
          '';
        };
      };

      networking.firewall.allowedTCPPorts = [8080];
      system.stateVersion = "23.11";
    };
  };

  services.nginx.virtualHosts."matrix.bddvlpr.com" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://192.168.101.1:8080";
  };

  environment.persistence."/nix/persist".directories = ["/opt/synapse-data" "/opt/synapse-postgresql"];
}
