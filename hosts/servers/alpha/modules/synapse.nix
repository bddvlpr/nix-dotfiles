{
  services = {
    matrix-synapse = {
      enable = true;

      settings = {
        server_name = "bddvlpr.com";
        listeners = [
          {
            port = 8008;
            bind_addresses = ["::1"];
            type = "http";
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

    nginx.virtualHosts."matrix.bddvlpr.com" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://[::1]:8008";
      };
    };
  };

  environment.persistence."/nix/persist".directories = [
    {
      directory = "/var/lib/postgresql";
      user = "postgres";
      group = "postgres";
    }
    {
      directory = "/var/lib/matrix-synapse";
      user = "matrix-synapse";
      group = "matrix-synapse";
    }
  ];
}
