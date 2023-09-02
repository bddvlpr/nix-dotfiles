{pkgs, ...}: {
  programs.discocss = {
    enable = true;

    package = pkgs.discocss.overrideAttrs (old: rec {
      version = "0.3.0";
      src = pkgs.fetchFromGitHub {
        owner = "bddvlpr";
        repo = "discocss";
        rev = "v${version}";
        hash = "sha256-2K7SPTvORzgZ1ZiCtS5TOShuAnmtI5NYkdQPRXIBP/I=";
      };
    });
    discordPackage = pkgs.discord.override {withVencord = true;};

    css = builtins.readFile (builtins.fetchurl {
      url = "https://web.archive.org/web/20230901100827id_/https://catppuccin.github.io/discord/dist/catppuccin-macchiato-lavender.theme.css";
      sha256 = "064y0fr0m3c1z760ii9silkk9mcr98kf68s9a3yfsdkw3641ignv";
    });
  };

  home.persistence."/nix/persist/home/bddvlpr".directories = [".config/discord"];
}
