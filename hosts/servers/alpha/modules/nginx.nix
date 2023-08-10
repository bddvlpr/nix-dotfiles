{
  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "admin@bddvlpr.com";
  };

  networking.firewall.allowedTCPPorts = [80 443];

  environment.persistence."/nix/persist".directories = [
    {
      directory = "/var/lib/acme";
      user = "acme";
      group = "acme";
    }
  ];
}
