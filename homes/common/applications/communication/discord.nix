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

    discordPackage = pkgs.discord.override {withVencord = true;};

    css = builtins.readFile (builtins.fetchurl {
      url = "https://web.archive.org/web/20231102191925id_/https://catppuccin.github.io/discord/dist/catppuccin-macchiato-lavender.theme.css";
      sha256 = "0z1pwfq5w2f2l2p5bry81sldrl8hpc5yn5q6xcyg3kq1fp9nbq3d";
    });
  };

  home.persistence."/nix/persist/home/bddvlpr".directories = [".config/discord" ".config/Vencord"];
}
