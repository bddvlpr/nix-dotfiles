{
  services = {
    hydra = {
      enable = true;
      hydraURL = "https://hydra.bddvlpr.com/";
      notificationSender = "hydra@localhost";
      useSubstitutes = true;
    };

    nginx.virtualHosts."hydra.bddvlpr.com" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:3000/";
      };
    };
  };

  environment.persistence."/nix/persist".directories = [
    "/var/lib/postgresql"
    "/var/lib/hydra"
  ];
}
