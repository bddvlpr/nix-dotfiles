let
  identity = import ../../../../identities/bddvlpr.nix;
in {
  services.nginx = {
    enable = true;

		recommendedGzipSettings = true;
		recommendedOptimisation = true;
		recommendedProxySettings = true;
		recommendedTlsSettings = true;

    virtualHosts."alpha.bddvlpr.com" = {
      addSSL = true;
      enableACME = true;
      root = "/nix/store";
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = identity.email;
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
