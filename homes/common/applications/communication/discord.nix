{pkgs, ...}: {
  programs.discocss = {
    enable = true;

    package = pkgs.discocss.overrideAttrs (old: rec {
      version = "0.3.1";
      src = pkgs.fetchFromGitHub {
        owner = "bddvlpr";
        repo = "discocss";
        rev = "v${version}";
        hash = "sha256-BFTxgUy2H/T92XikCsUMQ4arPbxf/7a7JPRewGqvqZQ=";
      };
    });

    #discordPackage = pkgs.discord.override {withVencord = false;};

    css = builtins.readFile (builtins.fetchurl {
      url = "https://web.archive.org/web/20231029105359id_/https://catppuccin.github.io/discord/dist/catppuccin-mocha-pink.theme.css";
      sha256 = "156x9vb3as1rsd2b3ajnf71w1ign1l8i147x4g5a9rbn4v6n2y1p";
    });
  };

  home.persistence."/nix/persist/home/bddvlpr".directories = [".config/discord"];
}
