{config, ...}: {
  nix.extraOptions = ''
    allowed-uris = https:// http://
  '';

  systemd.services.hydra-evaluator.environment.GC_DONT_GC = "true";

  services = {
    hydra = {
      enable = true;
      hydraURL = "https://hydra.bddvlpr.com/";
      notificationSender = "hydra@localhost";
      useSubstitutes = true;
      port = 3001;
    };

    nginx.virtualHosts."hydra.bddvlpr.com" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:${toString config.services.hydra.port}/";
      };
    };
  };

  environment.persistence."/nix/persist".directories = [
    "/var/lib/hydra"
  ];

  boot.binfmt.emulatedSystems = ["x86_64-linux" "aarch64-linux"];
}
