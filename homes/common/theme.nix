{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    image = ./wallpaper.jpeg;

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

  gtk.iconTheme = {
    name = "Papirus";
    package = pkgs.papirus-icon-theme;
  };

  home.packages = [pkgs.noto-fonts-cjk-sans];
}
