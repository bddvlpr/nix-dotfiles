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
      url = "https://cdnb.artstation.com/p/assets/images/images/028/971/403/large/jeremy-anninos-ahrifinal.jpg";
      hash = "sha256-kQf83oV/UjZXTxVVnTrgGeU2xM4+rDqYlQa7r2BnPEc=";
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

    targets = {
      waybar = {
        enableLeftBackColors = true;
        enableCenterBackColors = true;
        enableRightBackColors = true;
      };
    };
  };
}
