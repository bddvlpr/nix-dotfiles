{pkgs, ...}: {
  gtk = {
    enable = true;

    theme = {
      name = "Catppuccin-Macchiato-Standard-Lavender-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["lavender"];
        variant = "macchiato";
      };
    };

    font = {
      name = "RobotoMono Nerd Font";
    };
  };

  dconf.enable = true;
}
