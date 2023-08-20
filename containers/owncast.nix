{
  containers.owncast = {
    autoStart = true;
    ephemeral = true;

    privateNetwork = true;
    hostAddress = "192.168.100.1";
    localAddress = "192.168.101.2";

    bindMounts = {
      "/var/lib/owncast" = {
        hostPath = "/opt/owncast-data";
        isReadOnly = false;
      };
    };

    forwardPorts = [
      {
        containerPort = 1935;
        hostPort = 1935;
      }
    ];

    config = {
      pkgs,
      config,
      ...
    }: {
      services = {
        owncast = {
          enable = true;
          port = 8080;
          listen = "0.0.0.0";
        };
      };

      networking.firewall.allowedTCPPorts = [8080];
      system.stateVersion = "23.11";
    };
  };

  services.nginx.virtualHosts."cast.bddvlpr.com" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://192.168.101.2:8080";
  };

  environment.persistence."/nix/persist".directories = ["/opt/owncast-data"];
}
