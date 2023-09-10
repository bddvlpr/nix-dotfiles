{inputs, ...}: {
  containers.untis-ics-sync = {
    autoStart = true;
    ephemeral = true;

    privateNetwork = true;
    hostAddress = "192.168.100.1";
    localAddress = "192.168.101.4";

    specialArgs = {inherit inputs;};

    config = {
      pkgs,
      config,
      inputs,
      ...
    }: let
      user = "untis-ics-sync";
      group = user;
    in {
      users.users.${user} = {
        isSystemUser = true;
        inherit group;
      };

      users.groups.${group} = {};

      systemd.services.untis-ics-sync = {
        description = "Untis ICal Service";
        wantedBy = ["multi-user.target"];
        after = ["networking.target"];

        environment = {
          UNTIS_SCHOOLNAME = "ap-hogeschool-antwerpen";
          UNTIS_USERNAME = "student.em.s.ap";
          UNTIS_PASSWORD = "12345678"; # Not my account lol.
          UNTIS_BASEURL = "arche.webuntis.com";

          CORS_ORIGIN = "https://uis-ap.bddvlpr.com";
        };

        serviceConfig = {
          User = user;
          Group = group;
          ExecStart = "${pkgs.nodejs}/bin/node ${inputs.untis-ics-sync.packages.${pkgs.system}.default}/bin/untis-ics-sync";
          PrivateTmp = true;
          Restart = "always";
        };
      };

      networking.firewall.allowedTCPPorts = [3000];
      system.stateVersion = "23.11";
    };
  };

  services.nginx.virtualHosts."untis-ics-sync.bddvlpr.com" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://192.168.101.4:3000";
  };
}
