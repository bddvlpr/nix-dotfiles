{
  programs.discocss = {
    enable = true;

    css = builtins.readFile (builtins.fetchurl {
      url = "https://web.archive.org/web/20230610094926id_/https://catppuccin.github.io/discord/dist/catppuccin-macchiato-lavender.theme.css";
      sha256 = "04jmv45ivrxdhapcglsnspm5wgm9f0zmnxrqimw4l74z9i8w668s";
    });
  };

  home.persistence."/nix/persist/home/bddvlpr".directories = [".config/discord"];
}
