{
  containers.mediamtx = {
    autoStart = true;
    ephemeral = true;

    privateNetwork = true;
    hostAddress = "192.168.100.1";
    localAddress = "192.168.101.3";

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
        mediamtx = {
          enable = true;
          settings = {
            rtmpAddress = "0.0.0.0:1935";
            hlsAddress = "0.0.0.0:8080";

            paths.live = {
              overridePublisher = false;
            };
          };
        };
      };

      networking.firewall.allowedTCPPorts = [8080 1935];
      system.stateVersion = "23.11";
    };
  };

  services.nginx.virtualHosts."cast.bddvlpr.com" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://192.168.101.3:8080";
  };
}
