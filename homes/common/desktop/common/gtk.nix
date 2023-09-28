{pkgs, ...}: {
  gtk = {
    enable = true;

    theme = {
      name = "Catppuccin-Macchiato-Standard-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["lavender"];
        variant = "macchiato";
      };
    };

    iconTheme = {
      name = "Flat-Remix-Blue-Dark";
      package = pkgs.flat-remix-icon-theme;
    };

    font = {
      name = "RobotoMono Nerd Font";
    };
  };

  dconf.enable = true;
}
