{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    image = pkgs.fetchurl {
      url = "https://cdn.donmai.us/original/8a/0d/__yae_miko_genshin_impact_drawn_by_morimori_14292311__8a0db0479881a0e8f9744a9d49207739.jpg";
      hash = "sha256-eT6DBwDrtWgMmQzWnTS8DY5XcT7EJqoK3iBtC7CXb4Y=";
    };

    polarity = "dark";

    opacity = {
      desktop = 0.8;
      popups = 0.8;
      terminal = 0.8;
    };

    fonts = {
      serif = {
        package = pkgs.eb-garamond;
        name = "EB Garamond";
      };

      sansSerif = {
        package = pkgs.geist;
        name = "Geist";
      };

      emoji = {
        package = pkgs.twitter-color-emoji;
        name = "Twitter Color Emoji";
      };

      monospace = {
        package = pkgs.geist-nf;
        name = "GeistMono NFM";
      };
    };

    cursor = {
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors";
    };

    targets = {
      waybar.enable = false;
    };
  };
}
