{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    base16Scheme = ./theme.yml;

    image = pkgs.fetchurl {
      url = "https://github.com/NixOS/nixos-artwork/blob/ac0b0737b2fa81536e32f3498659f8c60884d93d/wallpapers/nix-wallpaper-dracula.png?raw=true";
      hash = "sha256-SykeFJXCzkeaxw06np0QkJCK28e0k30PdY8ZDVcQnh4=";
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

  gtk.iconTheme = {
    name = "Papirus";
    package = pkgs.papirus-icon-theme;
  };

  home.packages = [pkgs.noto-fonts-cjk-sans];
}
