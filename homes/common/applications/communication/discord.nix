{pkgs, ...}: {
  programs.discocss = {
    enable = true;

    package = pkgs.discocss.overrideAttrs (old: {
      src = pkgs.fetchFromGitHub {
        owner = "bddvlpr";
        repo = "discocss";
        rev = "610302e25a420b8cd6f08b8faff909685d2f79fd";
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
