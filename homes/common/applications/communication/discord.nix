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
      url = "http://web.archive.org/web/20230813135259id_/https://catppuccin.github.io/discord/dist/catppuccin-macchiato-lavender.theme.css";
      sha256 = "0kys50cz7z1y32xx332l3xq3lp4ybfls6njslp3xqjdwnhzvg16v";
    });
  };

  home.persistence."/nix/persist/home/bddvlpr".directories = [".config/discord"];
}
