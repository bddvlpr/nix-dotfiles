{
  pkgs,
  lib,
  ...
}: {
  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    commonHttpConfig = let
      realIpsFromList = lib.strings.concatMapStringsSep "\n" (x: "set_real_ip_from  ${x};");
      fileToList = x: lib.strings.splitString "\n" (builtins.readFile x);
      cfipv4 = fileToList (pkgs.fetchurl {
        url = "https://www.cloudflare.com/ips-v4";
        sha256 = "0ywy9sg7spafi3gm9q5wb59lbiq0swvf0q3iazl0maq1pj1nsb7h";
      });
      cfipv6 = fileToList (pkgs.fetchurl {
        url = "https://www.cloudflare.com/ips-v6";
        sha256 = "1ad09hijignj6zlqvdjxv7rjj8567z357zfavv201b9vx3ikk7cy";
      });
    in ''
         ${realIpsFromList cfipv4}
      ${realIpsFromList cfipv6}
      real_ip_header CF-Connecting-IP;
    '';
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
